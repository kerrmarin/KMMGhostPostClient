//
//  KMMGhostPostHTTPJSONClient.m
//  Pods
//
//  Created by Kerr Marin Miller on 20/07/2015.
//
//

#import "KMMGhostPostHTTPJSONClient.h"
#import "KMMGhostPost.h"

static NSString *KMMGhostPostsURLPath = @"/ghost/api/v0.1/posts";

@interface KMMGhostPostHTTPJSONClient ()

@property(nonatomic, strong, readonly) AFHTTPSessionManager* manager;

@end

@implementation KMMGhostPostHTTPJSONClient

- (instancetype)initWithSessionManager:(AFHTTPSessionManager *)sessionManager {
    if(self = [super init]) {
        _manager = sessionManager;
    }
    return self;
}

- (NSURLSessionDataTask *)getAllPostsWithBlock:(KMMGhostPostNetworkBlock)complete {
    if(!self.accessToken) {
        return nil;
    }
    NSURLSessionDataTask *task = [self.manager GET:KMMGhostPostsURLPath
                                        parameters:@{@"status" : @"all",
                                                     @"limit" : @"all",
                                                     @"access_token" : self.accessToken}
                                           success:^(NSURLSessionDataTask *task, id responseObject) {
                                               complete(responseObject, nil);
                                           } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                               complete(nil, error);
                                           }];
    return task;
}

- (NSURLSessionDataTask *)createPost:(KMMGhostPost *)post complete:(KMMGhostPostNetworkBlock)complete {
    if(!self.accessToken) {
        return nil;
    }
    NSDictionary *parameters = @{@"title" : post.title,
                                 @"markdown" : post.markdown,
                                 @"access_token" : self.accessToken};
    NSURLSessionDataTask *task = [self.manager POST:KMMGhostPostsURLPath
                                         parameters:parameters
                                            success:^(NSURLSessionDataTask *task, id responseObject) {
                                                complete(responseObject, nil);
                                            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                complete(nil, error);
                                            }];
    return task;
}

- (NSURLSessionDataTask *)getPostWithId:(NSUInteger)postId complete:(KMMGhostPostNetworkBlock)complete {
    if(!self.accessToken) {
        return nil;
    }
    NSString *path = [KMMGhostPostsURLPath stringByAppendingFormat:@"/%ld", (unsigned long)postId];
    NSURLSessionDataTask *task = [self.manager GET:path
                                        parameters:@{@"access_token" : self.accessToken}
                                           success:^(NSURLSessionDataTask *task, id responseObject) {
                                               complete(responseObject, nil);
                                           } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                               complete(nil, error);
                                           }];
    return task;
}

- (NSURLSessionDataTask *)updatePost:(KMMGhostPost *)post complete:(KMMGhostPostNetworkBlock)complete {
    if(!self.accessToken) {
        return nil;
    }
    NSDictionary *params = @{@"title" : post.title,
                             @"markdown" : post.markdown,
                             @"access_token" : self.accessToken};
    NSString *path = [KMMGhostPostsURLPath stringByAppendingFormat:@"/%ld", (unsigned long)post.postId];
    NSURLSessionDataTask *task = [self.manager PUT:path
                                        parameters:params
                                           success:^(NSURLSessionDataTask *task, id responseObject) {
                                               complete(responseObject, nil);
                                           } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                               complete(nil, error);
                                           }];
    return task;
}

- (NSURLSessionDataTask *)deletePostWithId:(NSUInteger)postId complete:(KMMGhostPostNetworkBlock)complete {
    if(!self.accessToken) {
        return nil;
    }
    NSString *path = [KMMGhostPostsURLPath stringByAppendingFormat:@"/%ld", (unsigned long)postId];
    NSURLSessionDataTask *task = [self.manager DELETE:path
                                           parameters:@{@"access_token" : self.accessToken}
                                              success:^(NSURLSessionDataTask *task, id responseObject) {
                                                  complete(responseObject, nil);
                                              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                                  complete(nil, error);
                                              }];
    return task;
}

@end
