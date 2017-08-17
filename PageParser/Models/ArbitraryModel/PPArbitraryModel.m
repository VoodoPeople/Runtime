//
//  PPArbitraryModel.m
//  PageParser
//
//  Created by Ozzy on 17.08.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "PPArbitraryModel.h"
#import "NSString+AutoId.h"

#import <objc/message.h>
#import <objc/objc-runtime.h>

@implementation PPArbitraryModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.productId = [NSString autoID:15];
    }
    return self;
}



- (void)addPropertyWithKey:(NSString*) key value:(NSString*) value {
    
    SEL selector = NSSelectorFromString(key);
    const char *cString = [key UTF8String];

    objc_property_attribute_t type = { "T", "@\"NSString\"" };
    objc_property_attribute_t ownership = { "C", "" }; // C = copy
    objc_property_attribute_t backingivar  = { "V", cString };
    objc_property_attribute_t attrs[] = { type, ownership, backingivar };
    class_addProperty([self class], cString, attrs, 3);
    objc_setAssociatedObject(self, selector, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}


- (NSDictionary*)propertiesDictionary {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; i++) {
        char const *propertyName = property_getName(properties[i]);
        const char *attr = property_getAttributes(properties[i]);
        
        if (attr[1] == '@') {
            
            NSString *selector = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            SEL sel = sel_registerName([selector UTF8String]);
            NSObject * propertyValue;
            propertyValue = objc_getAssociatedObject(self, sel);
            if (propertyValue == nil) {
               propertyValue = ((id (*)(id, SEL))objc_msgSend)(self,sel);
            }
            [dictionary setObject:propertyValue forKey:NSStringFromSelector(sel)];
        }
    }
    return [NSDictionary dictionaryWithDictionary:dictionary];
}

- (NSArray*)propertiesArray {
    
    NSMutableArray *keyValueArray = [NSMutableArray array];
    
    unsigned int propertyCount;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; i++) {
        char const *propertyName = property_getName(properties[i]);
        const char *attr = property_getAttributes(properties[i]);
        
        if (attr[1] == '@' && i < propertyCount-2) {
            
            NSString *selector = [NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding];
            SEL sel = sel_registerName([selector UTF8String]);
            NSObject * propertyValue = objc_getAssociatedObject(self, sel);
            if (propertyValue == nil) {
                propertyValue = ((id (*)(id, SEL))objc_msgSend)(self,sel);
            }
            NSDictionary* arrayItem = @{NSStringFromSelector(sel):propertyValue};
            [keyValueArray addObject:arrayItem];
            
        }
    }
    return keyValueArray;
}


+ (Class) makeSubclass:(NSString*) subclass{
    
    Class newClass = objc_allocateClassPair([PPArbitraryModel class], [subclass UTF8String], 0);
    objc_registerClassPair(newClass);
    
    return newClass;
}


@end
