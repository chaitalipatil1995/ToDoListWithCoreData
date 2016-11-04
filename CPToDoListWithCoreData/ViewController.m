//
//  ViewController.m
//  CPToDoListWithCoreData
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    contactsArray = [[NSArray alloc]init];
    [self.contactsTableView reloadData];
    [self.contactsTableView setBackgroundColor:[UIColor clearColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self fetchContactsFromCoreData];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return contactsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Contacts_cell"];
    
    NSManagedObjectContext *contacts = [contactsArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [contacts valueForKey:@"name"];
    cell.numberLabel.text = [contacts valueForKey:@"number"];
    cell.backgroundColor = [UIColor clearColor];

    return cell;
    
}


-(void)fetchContactsFromCoreData {
    
    NSManagedObjectContext *context = [self managedObjectContext];
    
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"CONTACTS"];
        
        NSError *error;
        contactsArray = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        
        if (error) {
            NSLog(@"%@",error.localizedDescription);
        }
        else {
            [self.contactsTableView reloadData];
        }
        
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



-(void)deleteEntry:(NSIndexPath *)indexPath{
    

        NSManagedObjectContext *context= [self managedObjectContext];
        
        [context deleteObject:[contactsArray objectAtIndex:indexPath.row]];
        
        NSError *error;
        if([context save:&error]){
            NSLog(@"Deleted");
            [self fetchContactsFromCoreData];
            
            [self.contactsTableView reloadData];

        }
}
    



- (IBAction)addAction:(id)sender {
    addContactsViewController *addContacts = [self.storyboard instantiateViewControllerWithIdentifier:@"addContactsViewController"];
    [self.navigationController pushViewController:addContacts animated:YES];
}
@end
