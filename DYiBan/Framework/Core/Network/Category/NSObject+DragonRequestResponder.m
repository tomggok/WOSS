//
//  NSObject+DragonRequestResponder.m
//  DragonFramework
//
//  Created by NewM on 13-4-1.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "NSObject+DragonRequestResponder.h"

@implementation NSObject (DragonRequestResponder)
@dynamic HTTP_GET,HTTP_POST;

- (DragonRequest *)GET:(NSString *)url
{
    return [self HTTP_GET:url];
}

- (DragonRequest *)GET_SYNC:(NSString *)url
{
    return [self HTTP_GET_SYNC:url];
}

- (DragonRequest *)GETDOWN:(NSString *)url
{
    return [self HTTP_GET_DOWN:url];
}

- (DragonRequest *)POST:(NSString *)url
{
    return [self HTTP_POST:url];
}

- (DragonRequest *)HTTP_GET:(NSString *)url
{
    DragonRequest *req = [DragonRequestQueue GET:url];
    [req addResponder:self];
    return req;
}

- (DragonRequest *)HTTP_GET_SYNC:(NSString *)url
{
    DragonRequest *req = [DragonRequestQueue GET_SYNC:url];
    [req addResponder:self];
    return req;
}

- (DragonRequest *)HTTP_POST:(NSString *)url
{
    DragonRequest *req = [DragonRequestQueue POST:url];
    [req addResponder:self];
    return req;
}

- (DragonRequest *)HTTP_GET_DOWN:(NSString *)url
{
    DragonRequest *req = [DragonRequestQueue GET:url];
    [req addResponder:self];
    
    NSArray *typeArr = [url componentsSeparatedByString:@"."];
    NSString *type = [typeArr lastObject];
    
    NSString *downFileName = [NSString stringWithFormat:@"%@.%@", [DragonCommentMethod md5:url], type];
    [req setDownloadName:downFileName];
    NSString *downloadPath = [NSString stringWithFormat:@"%@%@", [DragonCommentMethod downloadPath], downFileName];
    
    [req setDownloadDestinationPath:downloadPath];
    [req setTemporaryFileDownloadPath:[NSString stringWithFormat:@"%@.download", downloadPath]];
    [req setAllowResumeForFileDownloads:YES];//是否支持断点续传
    [req setDownloadProgressDelegate:req];//设置下载的代理回调
    
    return req;
}

- (BOOL)isRequestResponder
{
    if ([self respondsToSelector:@selector(handleRequest:)])
    {
        return YES;
    }
    return NO;
}

- (DragonRequestBlockS)HTTP_GET
{
    DragonRequestBlockS block = ^ DragonRequest * (NSString *url)
    {
        DragonRequest *req = [DragonRequestQueue GET:url];
        [req addResponder:self];
        return req;
    };
    return [[block copy] autorelease];
}

- (DragonRequestBlockS)HTTP_GET_DOWN
{
    DragonRequestBlockS block = ^ DragonRequest * (NSString *url)
    {
        DragonRequest *req = [DragonRequestQueue GET:url];
        [req addResponder:self];
        
        NSString *downFileName = [self downFileName:url];
        [req setDownloadName:downFileName];
        NSString *downloadPath = [self downPathFileName:downFileName];
        
        [req setDownloadDestinationPath:downloadPath];
        [req setTemporaryFileDownloadPath:[NSString stringWithFormat:@"%@.download", downloadPath]];
        [req setAllowResumeForFileDownloads:YES];//是否支持断点续传
        [req setDownloadProgressDelegate:req];//设置下载的代理回调
        
        return req;
    };
    return [[block copy] autorelease];
}

- (NSString *)downFileName:(NSString *)url
{
    NSArray *typeArr = [url componentsSeparatedByString:@"."];
    NSString *type = [typeArr lastObject];
    
    NSString *downFileName = [NSString stringWithFormat:@"%@.%@", [DragonCommentMethod md5:url], type];

    return downFileName;
}

- (NSString *)downPathFileName:(NSString *)downFileName
{
    NSString *downloadPath = [NSString stringWithFormat:@"%@%@", [DragonCommentMethod downloadPath], downFileName];

    return downloadPath;
}

- (NSString *)downPathFileNameWithUrl:(NSString *)url
{
    NSString *name = [self downPathFileName:[self downFileName:url]];
    
    return name;
}

- (DragonRequestBlockS)HTTP_POST
{
    DragonRequestBlockS block = ^DragonRequest*(NSString *url)
    {
        DragonRequest *req = [DragonRequestQueue POST:url];
        [req addResponder:self];
        return req;
    };
    return [[block copy] autorelease];
}

- (BOOL)isRequestingURL
{
    if ([self isRequestResponder])
    {
        return [DragonRequestQueue requesting:nil byResponder:self];
    }else
    {
        return NO;
    }
}

- (BOOL)isRequestingURL:(NSString *)url
{
    if ([self isRequestResponder])
    {
        return [DragonRequestQueue requesting:url byResponder:self];
    }else
    {
        return NO;
    }
}

- (NSArray *)requests
{
    return [DragonRequestQueue requests:nil byResponder:self];
}

- (NSArray *)requests:(NSString *)url
{
    return [DragonRequestQueue requests:url byResponder:self];
}

- (void)cancelRequests
{
    if ([self isRequestResponder]) {
        [DragonRequestQueue cancelRequestByResponder:self];
    }
}

- (void)cancelAllRequest
{
    [DragonRequestQueue cancelAllRequests];
}

- (void)cancelRequestWithUrl:(NSString *)url
{
    NSArray *arr = [self requests:url];
    for (int i = 0; i < [arr count]; i++)
    {
        DragonRequest *request = [arr objectAtIndex:i];
        
        [self cancelRequest:request];
    }
}

- (void)cancelRequest:(DragonRequest *)request
{
    [DragonRequestQueue cancelRequest:request];
}

- (void)handleRequest:(DragonRequest *)request
{
//    [self handleRequest:request];
}

- (void)handleRequest:(DragonRequest *)request receiveObj:(id)receiveObj
{   
}

- (void)downloadProgress:(CGFloat)newProgress request:(DragonRequest *)request
{
}

@end
