//
//  KMMGhostPostTests.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 11/07/2015.
//  Copyright (c) 2015 Kerr Marin Miller. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>

#import "KMMGhostPost.h"

@interface KMMGhostPostTests : XCTestCase

@end

@implementation KMMGhostPostTests

-(void)testInitialization {
    NSInteger postId = 1234;
    NSString *postUUID = @"asd123";
    NSString *title = @"Test title";
    NSString *slug = @"Test slug";
    KMMGhostPostStatus status = KMMGhostPostStatusDraft;
    NSString *markdown = @"##Test mark down";
    NSString *html = @"this is <html>";
    BOOL featured = YES;
    BOOL page = YES;
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    NSInteger authorId = 123;
    NSDate *createdAt = [NSDate dateWithTimeIntervalSince1970:123456];
    NSInteger createdBy = 12;
    NSDate *updatedAt = [NSDate dateWithTimeIntervalSince1970:654321];
    NSInteger updatedBy = 431;
    NSDate *publishedAt = [NSDate dateWithTimeIntervalSince1970:9999];
    NSInteger publishedBy = 99;
    NSArray *tags = @[];
    
    KMMGhostPost *post = [[KMMGhostPost alloc] initWithPostId:postId postUUID:postUUID title:title slug:slug status:status markdown:markdown html:html isFeatured:featured isPage:page locale:locale authorId:authorId createdAt:createdAt createdBy:createdBy updatedAt:updatedAt updatedBy:updatedBy publishedAt:publishedAt publishedBy:publishedBy tags:tags];
    
    XCTAssertEqual(postId, post.postId);
    XCTAssertEqual(status, post.status);
    XCTAssertEqual(authorId, post.authorId);
    XCTAssertEqual(createdBy, post.createdBy);
    XCTAssertEqual(updatedBy, post.updatedBy);
    XCTAssertEqual(publishedBy, post.publishedBy);
    XCTAssertEqual(featured, post.isFeatured);
    XCTAssertEqual(page, post.isPage);
    
    XCTAssertEqualObjects(postUUID, post.postUUID);
    XCTAssertEqualObjects(title, post.title);
    XCTAssertEqualObjects(slug, post.slug);
    XCTAssertEqualObjects(markdown, post.markdown);
    XCTAssertEqualObjects(html, post.html);
    XCTAssertEqualObjects(locale, post.locale);
    XCTAssertEqualObjects(createdAt, post.createdAt);
    XCTAssertEqualObjects(updatedAt, post.updatedAt);
    XCTAssertEqualObjects(publishedAt, post.publishedAt);
}

@end
