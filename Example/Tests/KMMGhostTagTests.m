//
//  KMMGhostTagTests.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 11/07/2015.
//  Copyright (c) 2015 Kerr Marin Miller. All rights reserved.
//

@import Foundation;
@import XCTest;

#import "KMMGhostTag.h"

@interface KMMGhostTagTests : XCTestCase

@end

@implementation KMMGhostTagTests

-(void)testInitialization {
    NSUInteger tagId = 1;
    NSString *tagUUID = @"asd123";
    NSString *name = @"test name";
    NSString *slug = @"test slug";
    NSDate *createdAt = [NSDate dateWithTimeIntervalSince1970:123456];
    NSUInteger createdBy = 123456;
    NSDate *updatedAt = [NSDate dateWithTimeIntervalSince1970:654321];
    NSUInteger updatedBy = 654321;
    
    KMMGhostTag *tag = [[KMMGhostTag alloc] initWithtagId:tagId tagUUID:tagUUID name:name slug:slug createdAt:createdAt createdBy:createdBy updatedAt:updatedAt updatedBy:updatedBy];
    
    XCTAssertEqual(tagId, tag.tagId);
    XCTAssertEqual(createdBy, tag.createdBy);
    XCTAssertEqual(updatedBy, tag.updatedBy);
    
    XCTAssertEqualObjects(tagUUID, tag.tagUUID);
    XCTAssertEqualObjects(name, tag.name);
    XCTAssertEqualObjects(slug, tag.slug);
    XCTAssertEqualObjects(createdAt, tag.createdAt);
    XCTAssertEqualObjects(updatedAt, tag.updatedAt);
}

@end
