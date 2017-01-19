//
//  Connection.m
//  PopularMovies
//
//  Created by Jhonathan Wyterlin on 19/01/17.
//  Copyright © 2017 Jhonathan Wyterlin. All rights reserved.
//

#import "Connection.h"

// Utils
#import "NetAPIClient.h"

// Category
#import "Reachability+Helper.h"

@implementation Connection

#pragma mark - Public methods

// Complete request method to the WebService
-(void)connectWithMethod:(RequestMethod)method
                     url:(NSString *)url
              parameters:(NSDictionary *)parameters
                 success:(void (^)(id responseData))success
                 failure:(void (^)(BOOL hasNoConnection, NSError *error))failure {
    
    [self connectWithMethod:method
          requestSerializer:RequestSerializerHTTP
                        url:url
                 parameters:parameters
                    success:success
                    failure:failure];
    
}

-(void)connectWithMethod:(RequestMethod)method
       requestSerializer:(RequestSerializer)requestSerializer
                     url:(NSString *)url
              parameters:(NSDictionary *)parameters
                 success:(void (^)(id responseData))success
                 failure:(void (^)(BOOL hasNoConnection, NSError *error))failure {
    
    if ( ! [Reachability isNetworkReachable] ) {
        
        NSLog(@"has no connection");
        
        if (failure)
            failure(YES,nil);
        
        return;
        
    }
    
    // Set RequestSerializer
    if ( requestSerializer == RequestSerializerHTTP ) {
        
        [[NetAPIClient sharedClient] setRequestSerializer:[AFHTTPRequestSerializer serializer]];
        
    } else {
        
        [[NetAPIClient sharedClient] setRequestSerializer:[AFJSONRequestSerializer serializer]];
        
    }
    
    void (^successBlock)(NSURLSessionTask *, id) = ^(NSURLSessionTask *task, id responseObject) {
        if ( success )
            success( responseObject );
    };
    
    void (^failureBlock)(NSURLSessionTask *, NSError *) = ^(NSURLSessionTask *operation, NSError *error) {
        if ( failure )
            failure( NO, error );
    };
    
    NSLog( @"url: %@%@",[[NetAPIClient sharedClient] baseURL], url );
    
    if ( method == RequestMethodGet ) {

        // Sents the GET to server and capture response object, giving back callbacks to consumer.
        [[NetAPIClient sharedClient] GET:url parameters:parameters progress:nil success:successBlock failure:failureBlock];
        
    } else if ( method == RequestMethodPost ) {
        
        // Sents the POST to server and capture response object, giving back callbacks to consumer.
        [[NetAPIClient sharedClient] POST:url parameters:parameters progress:nil success:successBlock failure:failureBlock];
        
    } else if ( method == RequestMethodPut ) {
        
        // Sents the PUT to server and capture response object, giving back callbacks to consumer.
        [[NetAPIClient sharedClient] PUT:url parameters:parameters success:successBlock failure:failureBlock];
        
    } else if ( method == RequestMethodDelete ) {
        
        // Sents the DELETE to server and capture response object, giving back callbacks to consumer.
        [[NetAPIClient sharedClient] DELETE:url parameters:parameters success:successBlock failure:failureBlock];
        
    }
    
}

@end
