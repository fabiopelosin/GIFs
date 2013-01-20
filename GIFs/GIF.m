//
//  GIF.m
//  GIFs
//
//  Created by orta therox on 12/01/2013.
//  Copyright (c) 2013 Orta Therox. All rights reserved.
//

#import "GIF.h"

@implementation GIF {
    NSString *_thumbnailURL;
    NSString *_downloadURL;
}

- (id)initWithRedditDictionary:(NSDictionary *)dictionary {
    self = [super init];

    _thumbnailURL = dictionary[@"data"][@"thumbnail"];

    _downloadURL = dictionary[@"data"][@"url"];
    _downloadURL = [_downloadURL stringByReplacingOccurrencesOfString:@"http://imgur.com/" withString:@"http://imgur.com/download/"];

    if (_thumbnailURL.length == 0) {
        _thumbnailURL = _downloadURL;
    }
    
    if ([_downloadURL rangeOfString:@"imgur"].location == NSNotFound) {
        return nil;
    }

    return self;
}

- (NSString *)imageUID {
    return _thumbnailURL;
}

- (NSString *)imageRepresentationType {
    return IKImageBrowserNSURLRepresentationType;
}

- (id) imageRepresentation {
    return [NSURL URLWithString:_thumbnailURL];
}

- (NSURL *)downloadURL {
    return  [NSURL URLWithString:_downloadURL];
}

@end
