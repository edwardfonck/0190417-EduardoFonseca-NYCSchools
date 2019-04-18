//
//  MasterViewController.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "SchoolListViewController.h"
#import "DetailTableViewController.h"

@interface SchoolListViewController (){
    Loading * loader;
    BOOL isSearching;
    
    //Main Array and it copy for filter
    NSMutableArray * arrSchools;
    NSMutableArray * arrSchoolsFilter;
}


@property (nonatomic, assign) BOOL collapseDetailViewController;
@end


static NSString *const kSegueDetailSchool  = @"GoToSchoolDetail";
static NSString *const kCellIdentifier = @"schoolCell";
@implementation SchoolListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [self setupView];
    
    //Get schools from Web Service
    [self getSchoolsList];
}

-(void)setupView{
    [self.tbSchoolList setTableFooterView:[UIView new]];
    self.collapseDetailViewController = YES;
    self.splitViewController.delegate = self;
}


-(void)getSchoolsList{
    
    //Load info from Json and reload tableView
    arrSchools = [NSMutableArray new];
    arrSchoolsFilter = [NSMutableArray new];
    isSearching = false;
    
    [Loading show];
    [SchoolWebServices service_getList:^(NSArray * _Nonnull objectArray) {
        self->arrSchools = [objectArray mutableCopy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loading remove];
            [self.tbSchoolList reloadData];
        });
    } error:^(NSError * _Nonnull err) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [Loading remove];
            [Utilities ShowAlertWithTitle:@"Advice" andMesssage:@"Schools not found" inViewController:self];
        });
    }];
}


#pragma mark - SplitViewController Delegate

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return self.collapseDetailViewController;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    self.collapseDetailViewController = NO;
    
    if ([[segue identifier] isEqualToString:kSegueDetailSchool]) {
        if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navController = segue.destinationViewController;
            if ([navController.topViewController isKindOfClass:[DetailTableViewController class]]) {
                
                
               
                DetailTableViewController *viewController = (DetailTableViewController *)navController.topViewController;
                viewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
                viewController.navigationItem.leftItemsSupplementBackButton = YES;
                viewController.schoolObjectDetail = (SchoolObject*)sender;
            }
        }
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return isSearching?arrSchoolsFilter.count:arrSchools.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray * presentArray = [[NSMutableArray alloc]initWithArray:isSearching?arrSchoolsFilter:arrSchools];
    
    SchoolObject *infoSchool = presentArray[indexPath.item];
    
    SchoolCell *cell = (SchoolCell*)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    [cell setupWithInfo:infoSchool];

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 155;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    [self performSegueWithIdentifier:kSegueDetailSchool sender:isSearching?arrSchoolsFilter[indexPath.row]:arrSchools[indexPath.row]];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.searchBar resignFirstResponder];
}

#pragma mark SearchBar Delegates

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(![searchText isEqualToString:@""]){
        isSearching = true;
        NSPredicate *searchPredicateByCityName = [NSPredicate predicateWithFormat:@"SELF.school_name contains[c] %@",searchText];
        
        NSArray *arraySearched = [arrSchools filteredArrayUsingPredicate: searchPredicateByCityName];
        arrSchoolsFilter = [arraySearched mutableCopy];
    }else{
        isSearching = false;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tbSchoolList reloadData];
    });
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
}


@end
