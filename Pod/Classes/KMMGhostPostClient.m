//
//  KMMGhostPostClient.m
//  Pods
//
//  Created by Kerr Marin Miller on 26/09/2015.
//
//

#import "KMMGhostPostClient.h"

#import "KMMGhostPostJSONParser.h"
#import "KMMGhostPostHTTPJSONClient.h"

@interface KMMGhostPostClient ()

@property (nonatomic) KMMGhostPostHTTPJSONClient *client;
@property (nonatomic, readonly) KMMGhostPostJSONParser *postParser;

@end

@implementation KMMGhostPostClient

+ (instancetype)defaultClient {
    static KMMGhostPostClient *postClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        postClient = [[self alloc] init];
    });
    return postClient;
}

- (instancetype)init {
    if (self = [super init]) {
        _postParser = [[KMMGhostPostJSONParser alloc] init];
    }
    return self;
}

- (void)initializeWithUrl:(NSURL *)url accessToken:(NSString *)accessToken{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    self.client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    self.client.accessToken = accessToken;
}

- (void)setAccessToken:(NSString *)accessToken {
    self.client.accessToken = accessToken;
}

- (void)getAllPostsWithBlock:(void (^)(NSArray *, NSError *))complete {
    if(!self.client) {
        return;
    }
    [self.client getAllPostsWithBlock:^(id results, NSError *error) {
        if(error) {
            complete(nil, error);
            return;
        } else {
            NSArray *posts = results[@"posts"];
            NSMutableArray *postObjects = [NSMutableArray arrayWithCapacity:posts.count];
            for (NSDictionary *post in posts) {
                KMMGhostPost *postObject = [self.postParser parsePostFromResponse:post error:nil];
                [postObjects addObject:postObject];
            }
            complete([postObjects copy], nil);
        }
    }];
}

- (void)getPostWithId:(NSUInteger)postId complete:(void (^)(KMMGhostPost * _Nullable, NSError * _Nullable))complete {
    if(!self.client) {
        return;
    }
    [self.client getPostWithId:postId complete:^(id  _Nullable results, NSError * _Nullable error) {
        if(error) {
            complete(nil, error);
        } else {
            NSArray *posts = results[@"posts"];
            KMMGhostPost *post = [self.postParser parsePostFromResponse:posts.firstObject error:&error];
            if(error) {
                complete(nil, error);
            } else {
                complete(post, nil);
            }
        }
    }];
}

- (void)createPost:(KMMGhostPost *)post complete:(void (^)(BOOL, NSError * _Nullable))complete {
    if(!self.client) {
        return;
    }
    [self.client createPost:post complete:^(id results, NSError *error) {
        if (error) {
            complete(NO, error);
        } else {
            complete(YES, nil);
        }
    }];
}

- (void)updatePost:(KMMGhostPost *)post complete:(void (^)(BOOL, NSError * _Nullable))complete {
    if(!self.client) {
        return;
    }
    [self.client updatePost:post complete:^(id  _Nullable results, NSError * _Nullable error) {
        if (error) {
            complete(NO, error);
        } else {
            complete(YES, nil);
        }
    }];
}

- (void)deletePostWithId:(NSUInteger)postId complete:(void (^)(BOOL, NSError * _Nullable))complete {
    if(!self.client) {
        return;
    }
    [self.client deletePostWithId:postId complete:^(id  _Nullable results, NSError * _Nullable error) {
        if(error) {
            complete(NO, error);
        } else {
            complete(YES, nil);
        }
    }];
}

@end
