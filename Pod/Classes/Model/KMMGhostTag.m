//
//  KMMGhostTag.m
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

#import "KMMGhostTag.h"

@implementation KMMGhostTag

-(instancetype)initWithtagId:(NSInteger)tagId
                    tagUUID:(NSString *)tagUUID
                       name:(NSString *)name
                       slug:(NSString *)slug
                  createdAt:(NSDate *)createdAt
                  createdBy:(NSInteger)createdBy
                  updatedAt:(NSDate *)updatedAt
                  updatedBy:(NSInteger)updatedBy {
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
