//
//  KMMGhostPostJSONParserTests.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 26/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

@import XCTest;

#import "KMMGhostPostJSONParser.h"
#import "KMMGhostPost.h"
#import "KMMGhostTag.h"

@interface KMMGhostPostJSONParserTests : XCTestCase

@end

@implementation KMMGhostPostJSONParserTests

- (void)testParsingDraftPost {
    KMMGhostPostJSONParser *parser = [[KMMGhostPostJSONParser alloc] init];
    NSDictionary *response =@{@"id":@2,
                              @"uuid":@"a29cab75-4379-4e0c-96c4-bd302d6026e6",
                              @"title":@"Ghost on an EC2 instance - Part 2",
                              @"slug":@"ghost-on-an-ec2-instance-part-2",
                              @"markdown":@"",
                              @"html":@"",
                              @"image":[NSNull null],
                              @"featured":@NO,
                              @"page":@NO,
                              @"status":@"draft",
                              @"language":@"en_US",
                              @"meta_title":[NSNull null],
                              @"meta_description":[NSNull null],
                              @"created_at":@"2015-07-06T22:21:04.383Z",
                              @"created_by":@1,
                              @"updated_at":@"2015-07-06T22:21:14.720Z",
                              @"updated_by":@1,
                              @"published_at":[NSNull null],
                              @"published_by":[NSNull null],
                              @"author":@1,
                              @"url":@"/ghost-on-an-ec2-instance-part-2/"};
    NSError *error = nil;
    KMMGhostPost *post = [parser parsePostFromResponse:response error:&error];
    XCTAssertEqualObjects(post.postUUID, @"a29cab75-4379-4e0c-96c4-bd302d6026e6");
    XCTAssertEqualObjects(post.slug, @"ghost-on-an-ec2-instance-part-2");
    XCTAssertEqualObjects(post.title, @"Ghost on an EC2 instance - Part 2");
    XCTAssertEqualObjects(post.markdown, @"");
    XCTAssertEqualObjects(post.html, @"");
    XCTAssertEqual(post.featured, NO);
    XCTAssertEqual(post.page, NO);
    XCTAssertEqual(post.status, KMMGhostPostStatusDraft);
    XCTAssertEqualObjects(post.locale.localeIdentifier, @"en_US");
    XCTAssertEqual(post.createdBy, 1);
    XCTAssertEqual(post.updatedBy, 1);
    XCTAssertEqual(post.authorId, 1);
    XCTAssertNil(post.publishedAt);
    XCTAssertNil(error);
    XCTAssertNotNil(post);
}

- (void)testParsingPublishedPost {
    KMMGhostPostJSONParser *parser = [[KMMGhostPostJSONParser alloc] init];
    NSDictionary *response =@{@"id" : @2,
                              @"uuid":@"a29cab75-4379-4e0c-96c4-bd302d6026e6",
                              @"title":@"Ghost on an EC2 instance - Part 2",
                              @"slug":@"ghost-on-an-ec2-instance-part-2",
                              @"markdown":@"#title",
                              @"html":@"<h1>title</h1>",
                              @"image":[NSNull null],
                              @"featured":@NO,
                              @"page":@NO,
                              @"status":@"published",
                              @"language":@"en_US",
                              @"meta_title":[NSNull null],
                              @"meta_description":[NSNull null],
                              @"created_at":@"2015-07-06T22:21:04.383Z",
                              @"created_by":@1,
                              @"updated_at":@"2015-07-06T22:21:14.720Z",
                              @"updated_by":@1,
                              @"published_at":@"2015-07-06T22:21:14.720Z",
                              @"published_by":@1,
                              @"author":@1,
                              @"url":@"/ghost-on-an-ec2-instance-part-2/",
                              @"tags" : @[@{@"id": @1,
                                           @"uuid": @"c912cb47-fe10-4120-aca3-19feb1a931d6",
                                           @"name": @"Getting Started",
                                           @"slug": @"getting-started",
                                           @"description": [NSNull null],
                                           @"parent_id": [NSNull null],
                                           @"meta_title": [NSNull null],
                                           @"meta_description": [NSNull null],
                                           @"created_at": @"2014-03-12T17:04:00.819Z",
                                           @"created_by": @1,
                                           @"updated_at": @"2014-03-12T17:04:00.819Z",
                                           @"updated_by": @1
                                           }]};
    NSError *error = nil;
    KMMGhostPost *post = [parser parsePostFromResponse:response error:&error];
    XCTAssertTrue(post.status == KMMGhostPostStatusPublished);
    XCTAssertEqual(post.postId, 2);
    XCTAssertEqualObjects(post.postUUID, @"a29cab75-4379-4e0c-96c4-bd302d6026e6");
    XCTAssertEqualObjects(post.slug, @"ghost-on-an-ec2-instance-part-2");
    XCTAssertEqualObjects(post.title, @"Ghost on an EC2 instance - Part 2");
    XCTAssertEqualObjects(post.markdown, @"#title");
    XCTAssertEqualObjects(post.html, @"<h1>title</h1>");
    XCTAssertEqual(post.featured, NO);
    XCTAssertEqual(post.page, NO);
    XCTAssertEqualObjects(post.locale.localeIdentifier, @"en_US");
    XCTAssertEqual(post.createdBy, 1);
    XCTAssertEqual(post.updatedBy, 1);
    XCTAssertEqual(post.authorId, 1);
    XCTAssertNotNil(post.updatedAt);
    XCTAssertNotNil(post.createdAt);
    XCTAssertNotNil(post.publishedAt);
    XCTAssertNil(error);
    XCTAssertNotNil(post);
    XCTAssertNotNil(post.tags);
    XCTAssertEqual(post.tags.count, 1);
    KMMGhostTag *tag = post.tags.firstObject;
    XCTAssertEqual(tag.tagId, 1);
    XCTAssertEqualObjects(tag.tagUUID, @"c912cb47-fe10-4120-aca3-19feb1a931d6");
    XCTAssertEqualObjects(tag.name, @"Getting Started");
    XCTAssertEqualObjects(tag.slug, @"getting-started");
}

@end
