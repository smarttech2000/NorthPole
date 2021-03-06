//
//  NPStorage.m
//  NorthPole
//
//  Created by Zsolt Balint on 6/15/13.
//  Copyright (c) 2013 InPos Soft. All rights reserved.
//

#import "NPStorage.h"
#import "AFNetworking.h"

@interface NPStorage() {
	AFHTTPClient *_client;
	
	NSDictionary *_params;
}

@end

#pragma mark -

@implementation NPStorage

#pragma mark -
#pragma mark Initialization

- (id)initWithParams:(NSDictionary *)params {
	if (self = [super init]) {
		_params = params;
		
		_client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://northpole.ro/storage?"]];
		_client.parameterEncoding = AFJSONParameterEncoding;
		[_client setDefaultHeader:@"Content-Type" value:@"application/json"];
	}
	return self;
}

#pragma mark -
#pragma mark Public methods

- (void)createWithCompletionBlock:(void (^)(id responseObject))completionBlock andFailBlock:(void (^)(NSError *error))failBlock {
	[_client postPath:@"storage" parameters:_params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSError *error = nil;
		id object = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
		if (!object) {
			failBlock(error);
		} else {
			completionBlock(object);
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		failBlock(error);
	}];
}

- (void)findWithCompletionBlock:(void (^)(id responseObject))completionBlock andFailBlock:(void (^)(NSError *error))failBlock {
	[_client getPath:@"storage" parameters:_params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSError *error = nil;
		id object = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
		if (!object) {
			failBlock(error);
		} else {
			completionBlock(object);
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		failBlock(error);
	}];
}

- (void)updateWithCompletionBlock:(void (^)(id responseObject))completionBlock andFailBlock:(void (^)(NSError *error))failBlock {
	[_client putPath:@"storage" parameters:_params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSError *error = nil;
		id object = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
		if (!object) {
			failBlock(error);
		} else {
			completionBlock(object);
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		failBlock(error);
	}];
}

- (void)deleteWithCompletionBlock:(void (^)(id responseObject))completionBlock andFailBlock:(void (^)(NSError *error))failBlock {
	[_client deletePath:@"storage" parameters:_params success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSError *error = nil;
		id object = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
		if (!object) {
			failBlock(error);
		} else {
			completionBlock(object);
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		failBlock(error);
	}];
}

@end