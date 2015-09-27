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
    
    NSDictionary *params =@{@"status" : @"all", @"limit" : @"all"};
    OCMExpect([manager GET:@"/ghost/api/v0.1/posts"
                parameters:params
                   success:OCMOCK_ANY
                   failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    
    [client getAllPostsWithBlock:OCMOCK_ANY];
}

- (void)testGetPostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    
    OCMExpect([manager GET:@"/ghost/api/v0.1/posts/1"
                parameters:nil
                   success:OCMOCK_ANY
                   failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    
    [client getPostWithId:1 complete:OCMOCK_ANY];
}

- (void)testCreatePostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    id post = OCMClassMock([KMMGhostPost class]);
    
    OCMStub([post title]).andReturn(@"testTitle");
    OCMStub([post markdown]).andReturn(@"testMarkdown");
    
    NSDictionary *params = @{@"title": @"testTitle", @"markdown" : @"testMarkdown"};
    OCMExpect([manager POST:@"/ghost/api/v0.1/posts"
                 parameters:params
                    success:OCMOCK_ANY
                    failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    
    [client createPost:post complete:OCMOCK_ANY];
}

- (void)testUpdatePostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    id post = OCMClassMock([KMMGhostPost class]);
    
    OCMStub([post title]).andReturn(@"testTitle");
    OCMStub([post markdown]).andReturn(@"testMarkdown");
    OCMStub([post postId]).andReturn(1);
    
    NSDictionary *params = @{@"title": @"testTitle", @"markdown" : @"testMarkdown"};
    OCMExpect([manager  PUT:@"/ghost/api/v0.1/posts/1"
                 parameters:params
                    success:OCMOCK_ANY
                    failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    
    [client updatePost:post complete:OCMOCK_ANY];
}

- (void)testDeletePostWillSendCorrectParameters {
    id manager = OCMClassMock([AFHTTPSessionManager class]);
    
    OCMExpect([manager DELETE:@"/ghost/api/v0.1/posts/1"
                   parameters:nil
                      success:OCMOCK_ANY
                      failure:OCMOCK_ANY]);
    
    KMMGhostPostHTTPJSONClient *client = [[KMMGhostPostHTTPJSONClient alloc] initWithSessionManager:manager];
    
    [client deletePostWithId:1 complete:OCMOCK_ANY];
}

@end
