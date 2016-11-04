//
//  addContactsViewController.m
//  CPToDoListWithCoreData
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//

#import "addContactsViewController.h"

@interface addContactsViewController ()

@end

@implementation addContactsViewController

-(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context = nil;
    
    id delegate = [[UIApplication sharedApplication]delegate];
    
    if ([delegate performSelector:@selector(managedObjectContext)]) {        context = [delegate managedObjectContext];
    }
    return context;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)doneAction:(id)sender {
    NSString *name = self.nameField.text;
    NSString *number = self.numberField.text;
    
    
        if (name.length > 0){
            if (number.length > 0) {
                
                    NSManagedObjectContext *context = [self managedObjectContext];
                    
                    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"CONTACTS" inManagedObjectContext:context];
                    
                    [newDevice setValue:name forKey:@"name"];
                    [newDevice setValue:number forKey:@"number"];
                
                    NSError *error;
                    
                    if ([context save:&error]) {
                        NSLog(@"Saved");
                        
                        [self.navigationController popViewControllerAnimated:YES];
                    }
                    else {
                        NSLog(@"Unable to save : %@",error.localizedDescription);
                    }
                    
                }
        }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    if (textField == self.nameField) {
        [self.numberField becomeFirstResponder];
    }
    
    return YES;
}
@end
