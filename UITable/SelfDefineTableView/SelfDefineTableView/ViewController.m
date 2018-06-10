//
//  ViewController.m
//  SelfDefineTableView
//
//  Created by Alan Lu on 2016/11/01.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "ViewController.h"
#import "CustomCellTableViewCell.h"

@interface ViewController ()
@property(nonatomic,copy)NSArray *dataList;
@property(nonatomic,copy)NSArray *imageList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *pistURL=[[NSBundle mainBundle] URLForResource:@"friendsInfo" withExtension:@"plist"];
    NSDictionary *dictionary=[NSDictionary dictionaryWithContentsOfURL:pistURL];
    NSMutableArray *tmpDataArray=[NSMutableArray new];
    NSMutableArray *tmpImageArray=[NSMutableArray new];
    for(int i=0;i<[dictionary count];i++){
        NSString *key=[NSString stringWithFormat:@"%i",i+1];
        NSDictionary *tmpDic=[dictionary objectForKey:key];
        [tmpDataArray addObject:tmpDic];
        NSString *imageUrl=[NSString stringWithFormat:@"%i.png",i+1];
        UIImage *image=[UIImage imageNamed:imageUrl];
        [tmpImageArray addObject:image];
    }
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.dataList=[tmpDataArray copy];
    self.imageList=[tmpImageArray copy];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataList count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"CustomCellIdentifier";
    static BOOL isRegistered=NO;
    if(!isRegistered){
        UINib *nib=[UINib nibWithNibName:@"CustomCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:identifier];
        isRegistered=YES;
    }
    CustomCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    NSDictionary *rowData=[_dataList objectAtIndex:indexPath.row];
    cell.name=[rowData objectForKey:@"name"];
    cell.dec=[rowData objectForKey:@"dec"];
    cell.loc=[rowData objectForKey:@"loc"];
    cell.image=[_imageList objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
