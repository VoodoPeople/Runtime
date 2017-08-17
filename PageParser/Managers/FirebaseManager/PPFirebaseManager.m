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


-(void) writeToNode:(NSString*) node product:(ProductModel*) productModel{
    
    [[self.rootReference child:node] setValue:[productModel toDictionary] withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
    
    }];
}

-(void)readFromNode:(NSString*) node completion:(void(^)(NSDictionary* result)) completion{
    
    [[self.rootReference child:node] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        completion(nil);
    }];
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


@end
