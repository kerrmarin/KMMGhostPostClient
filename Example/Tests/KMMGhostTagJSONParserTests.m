//
//  KMMGhostTagJSONParserTests.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 26/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

@import XCTest;

#import "KMMGhostTag.h"
#import "KMMGhostTagJSONParser.h"

@interface KMMGhostTagJSONParserTests : XCTestCase

@end

@implementation KMMGhostTagJSONParserTests

- (void)testParsingTag {
    NSDictionary *response = @{@"id": @1,
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
    };
    
    KMMGhostTagJSONParser *parser = [[KMMGhostTagJSONParser alloc] init];
    NSError *error = nil;
    KMMGhostTag *tag = [parser parseTagFromResponse:response error:&error];
    XCTAssertNotNil(tag);
    XCTAssertNil(error);
    XCTAssertEqual(tag.tagId, 1);
    XCTAssertEqualObjects(tag.tagUUID, @"c912cb47-fe10-4120-aca3-19feb1a931d6");
    XCTAssertEqualObjects(tag.name, @"Getting Started");
    XCTAssertEqualObjects(tag.slug, @"getting-started");
    XCTAssertEqual(tag.createdBy, 1);
    XCTAssertEqual(tag.updatedBy, 1);
}

@end
