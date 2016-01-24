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

- (void)testParsingPostWithImage_ShouldParseImagePath {
    KMMGhostPostJSONParser *parser = [[KMMGhostPostJSONParser alloc] init];
    NSUInteger postId = 2;
    NSUInteger author = 1;
    NSDictionary *response =@{@"id":@(postId),
                              @"uuid":@"a29cab75-4379-4e0c-96c4-bd302d6026e6",
                              @"title":@"Ghost on an EC2 instance - Part 2",
                              @"slug":@"ghost-on-an-ec2-instance-part-2",
                              @"markdown":@"",
                              @"html":@"",
                              @"image":@"/my/path/image.jpg",
                              @"featured":@NO,
                              @"page":@NO,
                              @"status":@"draft",
                              @"language":@"en_US",
                              @"meta_title":[NSNull null],
                              @"meta_description":[NSNull null],
                              @"created_at":@"2015-07-06T22:21:04.383Z",
                              @"created_by":@(author),
                              @"updated_at":@"2015-07-06T22:21:14.720Z",
                              @"updated_by":@(author),
                              @"published_at":[NSNull null],
                              @"published_by":[NSNull null],
                              @"author":@(author),
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
    XCTAssertEqual(post.createdBy, author);
    XCTAssertEqual(post.updatedBy, author);
    XCTAssertEqual(post.authorId, author);
    XCTAssertNil(post.publishedAt);
    XCTAssertEqualObjects(post.imagePath, @"/my/path/image.jpg");
    XCTAssertNil(error);
    XCTAssertNotNil(post);
}

- (void)testParsingDraftPost {
    KMMGhostPostJSONParser *parser = [[KMMGhostPostJSONParser alloc] init];
    NSUInteger postId = 2;
    NSUInteger author = 1;
    NSDictionary *response =@{@"id":@(postId),
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
                              @"created_by":@(author),
                              @"updated_at":@"2015-07-06T22:21:14.720Z",
                              @"updated_by":@(author),
                              @"published_at":[NSNull null],
                              @"published_by":[NSNull null],
                              @"author":@(author),
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
    XCTAssertEqual(post.createdBy, author);
    XCTAssertEqual(post.updatedBy, author);
    XCTAssertEqual(post.authorId, author);
    XCTAssertNil(post.publishedAt);
    XCTAssertNil(error);
    XCTAssertNotNil(post);
}

- (void)testParsingPublishedPost {
    NSUInteger postId = 2;
    NSUInteger author = 1;
    KMMGhostPostJSONParser *parser = [[KMMGhostPostJSONParser alloc] init];
    NSDictionary *response =@{@"id" : @(postId),
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
                              @"created_by":@(author),
                              @"updated_at":@"2015-07-06T22:21:14.720Z",
                              @"updated_by":@(author),
                              @"published_at":@"2015-07-06T22:21:14.720Z",
                              @"published_by":@(author),
                              @"author":@(author),
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
                                           @"created_by": @(author),
                                           @"updated_at": @"2014-03-12T17:04:00.819Z",
                                           @"updated_by": @(author)
                                           }]};
    NSError *error = nil;
    KMMGhostPost *post = [parser parsePostFromResponse:response error:&error];
    XCTAssertTrue(post.status == KMMGhostPostStatusPublished);
    XCTAssertEqual(post.postId, (NSUInteger)2);
    XCTAssertEqualObjects(post.postUUID, @"a29cab75-4379-4e0c-96c4-bd302d6026e6");
    XCTAssertEqualObjects(post.slug, @"ghost-on-an-ec2-instance-part-2");
    XCTAssertEqualObjects(post.title, @"Ghost on an EC2 instance - Part 2");
    XCTAssertEqualObjects(post.markdown, @"#title");
    XCTAssertEqualObjects(post.html, @"<h1>title</h1>");
    XCTAssertEqual(post.featured, NO);
    XCTAssertEqual(post.page, NO);
    XCTAssertEqualObjects(post.locale.localeIdentifier, @"en_US");
    XCTAssertEqual(post.createdBy, author);
    XCTAssertEqual(post.updatedBy, author);
    XCTAssertEqual(post.authorId, author);
    XCTAssertNotNil(post.updatedAt);
    XCTAssertNotNil(post.createdAt);
    XCTAssertNotNil(post.publishedAt);
    XCTAssertNil(error);
    XCTAssertNotNil(post);
    XCTAssertNotNil(post.tags);
    XCTAssertEqual(post.tags.count, author);
    KMMGhostTag *tag = post.tags.firstObject;
    XCTAssertEqual(tag.tagId, author);
    XCTAssertEqualObjects(tag.tagUUID, @"c912cb47-fe10-4120-aca3-19feb1a931d6");
    XCTAssertEqualObjects(tag.name, @"Getting Started");
    XCTAssertEqualObjects(tag.slug, @"getting-started");
}

@end

