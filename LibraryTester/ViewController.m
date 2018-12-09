//
//  ViewController.m
//  LibraryTester
//
//  Created by 高志刚 on 2018/3/3.
//  Copyright © 2018年 高志刚. All rights reserved.
//

#import "ViewController.h"
#import "GRcord.h"

@interface ViewController ()
@property (nonatomic,strong) GRcord *tester;

@end

@implementation ViewController
- (GRcord* )tester
{
    if (_tester ==nil ) _tester = [[GRcord alloc] init];
    return _tester;
}
typedef double (^test_block)(double arg);

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@" GRcordRecording is %d now",self.tester.GRcordRecording);
    NSDictionary* block_tester=[[NSDictionary alloc]  init];
    [block_tester enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"value for key %@ is %@",key,obj);
        if([@"stop" isEqualToString:key])
        {
            *stop=YES;
        }
    }];
    
    test_block local_test_block;
    local_test_block=^(double arg){
        return arg * arg;
    
    };
    
    dispatch_queue_t test_queue=dispatch_queue_create("queue_lable", NULL);
    dispatch_async(test_queue, ^{
        NSLog(@"do nothing");
        /* give the things back to the main thread (aka, main dispath queue)*/
        dispatch_async(dispatch_get_main_queue(), ^{
            /* do image thing ,UI things */
        });
    });
    //dispatch_release(test_queue);
}
-(void)class_block_method:(NSString*)op willexcute:(test_block)arg_block
{
    arg_block(1.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
