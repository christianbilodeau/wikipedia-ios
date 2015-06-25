//  Created by Monte Hurd on 6/2/15.
//  Copyright (c) 2015 Wikimedia Foundation. Provided under MIT-style license; please copy and modify!

#import "NSURL+Extras.h"
#import "NSString+Extras.h"

@implementation NSURL (Extras)

+ (nullable instancetype)wmf_optionalURLWithString:(nullable NSString*)string {
    return string.length ? [NSURL URLWithString : string] : nil;
}

- (BOOL)wmf_isEqualToIgnoringScheme:(NSURL*)url {
    return [self.wmf_schemelessURLString isEqualToString:url.wmf_schemelessURLString];
}

- (NSString*)wmf_schemelessURLString {
    if (self.scheme.length) {
        return [self.absoluteString wmf_safeSubstringFromIndex:self.scheme.length + 1];
    } else {
        return self.absoluteString;
    }
}

- (NSString*)wmf_mimeTypeForExtension {
    return [self.pathExtension wmf_asMIMEType];
}

@end
