//
//  KMMGhostTag.m
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

#import "KMMGhostTag.h"

@implementation KMMGhostTag

-(nullable instancetype)initWithtagId:(NSUInteger)tagId
                              tagUUID:(NSString *)tagUUID
                                 name:(NSString *)name
                                 slug:(NSString *)slug
                            createdAt:(NSDate *)createdAt
                            createdBy:(NSUInteger)createdBy
                            updatedAt:(NSDate *)updatedAt
                            updatedBy:(NSUInteger)updatedBy {
    
    if(self = [super init]) {
        _tagId = tagId;
        _tagUUID = [tagUUID copy];
        _name = [name copy];
        _slug = [slug copy];
        _createdAt = createdAt;
        _createdBy = createdBy;
        _updatedAt = updatedAt;
        _updatedBy = updatedBy;
    }
    
    return self;
}
@end
