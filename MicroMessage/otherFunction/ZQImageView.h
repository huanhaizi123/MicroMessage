//
//  ZQImageView.h
//  MicroMessage
//
//  Created by jky-group on 14-7-1.
//  Copyright (c) 2014年 jky-group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQImageView : UIImageView<NSURLConnectionDataDelegate>
{
    NSMutableData *imgData;
    UIActivityIndicatorView *activeView;
}

- (id)initWithURL:(NSString *)URLStr;

- (void)setURLStr:(NSString *)URLStr;

@end
