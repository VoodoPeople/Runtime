//
//  PPFirebaseManager.m
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "PPFirebaseManager.h"
#import "Firebase.h"
#import "ProductModel.h"
#import "PPArbitraryModel.h"


static NSString *const kDevelopmentBranch = @"OBJCRuntimeDB";

static PPFirebaseManager *sharedManager;

@interface PPFirebaseManager ()

@property (strong, nonatomic) FIRDatabaseReference *rootReference;
@property (strong, nonatomic) FIRDatabase *database;

@end

@implementation PPFirebaseManager


+ (PPFirebaseManager*)sharedInstance {
    
    if (sharedManager != nil) {
        return sharedManager;
    }
    @synchronized (self) {
        sharedManager = [[PPFirebaseManager alloc] init];
    }
    return sharedManager;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        self.rootReference = [FIRDatabase.database.reference child:kDevelopmentBranch];
    }
    return self;
}


- (void)saveProduct:(PPArbitraryModel*) arbModel withCompletion:(void(^)(NSError *error)) completion {
    
    [[[self.rootReference child:@"products"] child:arbModel.productId] setValue:[arbModel propertiesDictionary] withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (error) {
            completion(error);
        } else {
            completion(nil);
        }
    }];
}

- (void)getAllProductsWithCompletion:(void(^)(NSArray* array,NSError *error)) completion {
    
    [[self.rootReference child:@"products"] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        NSDictionary *snapshotValue = snapshot.value;
        
        if ([snapshotValue isKindOfClass:[NSNull class]]) {
            completion(nil,[[NSError alloc] init]);
        } else {
            
            NSMutableArray *products = [NSMutableArray array];
            
            
            for (NSString *key in snapshotValue) {
                
                NSDictionary* value = [snapshotValue valueForKey:key];
                NSString *subclassName = [value valueForKey:@"productName"];
                if (subclassName == nil) {
                    continue;
                }
                PPArbitraryModel *model = [[[PPArbitraryModel makeSubclass:subclassName] alloc] init];

                for (NSString *propertyName in value) {
                    NSString* propertyValue = [value valueForKey:key];
                    [model addPropertyWithKey:propertyName value:propertyValue];
                }
                [products addObject:model];
            }
            completion(products,nil);
        }
    }];
    
}



@end
