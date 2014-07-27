//
//  CycleTableView.m
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import "CycleTableView.h"

@implementation CycleTableView


- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [app.cycleArray count];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0;
//}
//
//- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *v = [[UIView alloc]initWithFrame:CGRectZero];
//    
//    return v;
//}

// section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    
    if ([ [app.cycleArray objectAtIndex:indexPath.row] hasPrefix:@"-[Ap"]) {
        cell.textLabel.textColor = [UIColor redColor];
    } else if ([ [app.cycleArray objectAtIndex:indexPath.row] hasPrefix:@"-[Vi"]){
        cell.textLabel.textColor = [UIColor blueColor];
    } else if ([ [app.cycleArray objectAtIndex:indexPath.row] hasPrefix:@"-[Mo"]){
        cell.textLabel.textColor = [UIColor colorWithRed:0.000 green:0.739 blue:0.240 alpha:1.000];
    } else if ([ [app.cycleArray objectAtIndex:indexPath.row] hasPrefix:@"-[Na"]){
        cell.textLabel.textColor = [UIColor colorWithRed:0.877 green:0.201 blue:0.706 alpha:1.000];
    } else {
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    

    if (app.selectCell.row == indexPath.row) {
        [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
    
    cell.textLabel.text = [app.cycleArray objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:10];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    app.selectCell = indexPath;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    app.TablePosition = [self contentOffset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    app.TablePosition = [self contentOffset];
}

-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    float width = self.frame.size.width;
    
    CGSize size = [[app.cycleArray objectAtIndex:indexPath.row] sizeWithFont:[UIFont systemFontOfSize:10] constrainedToSize:CGSizeMake(width - 40, 200) lineBreakMode:NSLineBreakByWordWrapping];
    
    if (size.height < 33) {
        return 43;
    }
    return size.height + 18;
}

@end
