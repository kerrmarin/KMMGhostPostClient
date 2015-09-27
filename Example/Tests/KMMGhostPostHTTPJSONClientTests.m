//
//  KMMGhostPostHTTPJSONClientTests.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 26/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

@import XCTest;

#import "KMMGhostPostHTTPJSONClient.h"

#import "KMMGhostPost.h"
#import <AFNetworking/AFNetworking.h>

#import "OCMock.h"

@interface KMMGhostPostHTTPJSONClientTests : XCTestCase

@end

@implementation KMMGhostPostHTTPJSONClientTests

- (void)testInitialization {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    
    XCTAssertNotNil(client);
}

- (void)testGetAllPostsWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    
    NSDictionary *params =@{@"status" : @"all", @"limit" : @"all", @"access_token" : @"test"};
    OCMExpect([manager GET:@"/ghost/api/v0.1/posts"
                parameters:params
                   success:OCMOCK_ANY
                   failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    client.accessToken = @"test";
    
    [client getAllPostsWithBlock:OCMOCK_ANY];
    
    OCMVerifyAll(manager);
}

- (void)testGetPostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    
    OCMExpect([manager GET:@"/ghost/api/v0.1/posts/1"
                parameters:@{@"access_token" : @"test"}
                   success:OCMOCK_ANY
                   failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    client.accessToken = @"test";
    
    [client getPostWithId:1 complete:OCMOCK_ANY];
    
    OCMVerifyAll(manager);
}

- (void)testCreatePostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    id post = OCMClassMock([KMMGhostPost class]);
    
    OCMStub([post title]).andReturn(@"testTitle");
    OCMStub([post markdown]).andReturn(@"testMarkdown");
    
    NSDictionary *params = @{@"title": @"testTitle", @"markdown" : @"testMarkdown", @"access_token" : @"test"};
    OCMExpect([manager POST:@"/ghost/api/v0.1/posts"
                 parameters:params
                    success:OCMOCK_ANY
                    failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    client.accessToken = @"test";
    
    [client createPost:post complete:OCMOCK_ANY];
    
    OCMVerifyAll(manager);
}

- (void)testUpdatePostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    id post = OCMClassMock([KMMGhostPost class]);
    
    OCMStub([post title]).andReturn(@"testTitle");
    OCMStub([post markdown]).andReturn(@"testMarkdown");
    OCMStub([post postId]).andReturn(1);
    
    NSDictionary *params = @{@"title": @"testTitle", @"markdown" : @"testMarkdown", @"access_token" : @"test"};
    OCMExpect([manager  PUT:@"/ghost/api/v0.1/posts/1"
                 parameters:params
                    success:OCMOCK_ANY
                    failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    client.accessToken = @"test";
    
    [client updatePost:post complete:OCMOCK_ANY];
    
    OCMVerifyAll(manager);
}

- (void)testDeletePostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    
    OCMExpect([manager DELETE:@"/ghost/api/v0.1/posts/1"
                   parameters:@{@"access_token" : @"test"}
                      success:OCMOCK_ANY
                      failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    client.accessToken = @"test";
    
    [client deletePostWithId:1 complete:OCMOCK_ANY];
    
    OCMVerifyAll(manager);
}

@end
