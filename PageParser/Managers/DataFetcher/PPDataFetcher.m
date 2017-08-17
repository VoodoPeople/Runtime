//
//  PPDataFetcher.m
//  PageParser
//
//  Created by Ozzy on 14.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "PPDataFetcher.h"
#import "TFHpple.h"
static PPDataFetcher *dataFetcher = nil;

static NSString *const kURLForDownloadData = @"https://www.sheldonbrown.com/web_sample1.html";
static NSString *const kBaseHTMLFile = @"HTMLBase";


@interface PPDataFetcher()

@property (strong, nonatomic) TFHpple *parser;

@end


@implementation PPDataFetcher


//Usage

//BOOL result =  [[PPDataFetcher dataFetcherManager] downloadHtmlPageData];
//[[PPDataFetcher dataFetcherManager] parseProductItem];


+(id)dataFetcherManager{
    
    if (dataFetcher != nil) {
        return dataFetcher;
    }
    @synchronized (self) {
        dataFetcher = [[PPDataFetcher alloc] init];
    }
    return dataFetcher;
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(BOOL) writeDataToFile:(NSData*) htmlData withName:(NSString*) fileName{
    
    NSError *error;
    NSString *stringFromData = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
    
    NSString *fileNameWithExt = [NSString stringWithFormat:@"%@.txt",fileName];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileNameWithExt];
    
    
    if (stringFromData !=nil) {
        return [stringFromData writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    }
    return NO;
}



-(NSData*) readFromFile:(NSString*) fileName{
//    NSError *error;
    NSString *fileNameWithExt = [NSString stringWithFormat:@"%@.txt",fileName];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileNameWithExt];
//    
//    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
//    NSLog(@"%@", str);
    
    return [NSData dataWithContentsOfFile:filePath];
    
}



#pragma mark - Public

-(BOOL) downloadHtmlPageData{
    NSData *htmlData = [self readFromFile:kBaseHTMLFile];
    if (htmlData != nil) {
        self.parser = [TFHpple hppleWithHTMLData:htmlData];
    }else{
        NSURL *tutorialsUrl = [NSURL URLWithString:kURLForDownloadData];
        NSData *downloadedHtmlData = [NSData dataWithContentsOfURL:tutorialsUrl];
        if ([self writeDataToFile:downloadedHtmlData withName:kBaseHTMLFile]) {
            self.parser = [TFHpple hppleWithHTMLData:downloadedHtmlData];
        }else{
            return NO;
        }
    }

    return YES;
}


-(void) parseProductItem{
    
    NSString *tutorialsXpathQueryString = @"//body/center/table/tr";
    
    NSArray *tutorialsNodes = [self.parser searchWithXPathQuery:tutorialsXpathQueryString];
    
    for (TFHppleElement *element in tutorialsNodes) {
        [self getChild:element];
    }
}



-(TFHppleElement*) getChild:(TFHppleElement*) parent{
    
    TFHppleElement *child = parent.children.lastObject;
    [self getLinkFromNode:child];
    if (child == nil) {
        return parent;
    }
    
    return [self getChild:child];
}

-(void) getLinkFromNode:(TFHppleElement*) element {
    TFHpple *parseLink  = [[TFHpple alloc] initWithHTMLData:[element.raw dataUsingEncoding:NSUTF8StringEncoding]];
     NSArray *links = [parseLink searchWithXPathQuery:@"//a"];
    for (TFHppleElement *link in links) {
        NSLog(@"%@",link.attributes.allValues);
    }
}

@end
