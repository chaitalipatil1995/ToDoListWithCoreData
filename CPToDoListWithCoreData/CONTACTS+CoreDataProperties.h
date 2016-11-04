//
//  CONTACTS+CoreDataProperties.h
//  CPToDoListWithCoreData
//
//  Created by Student P_07 on 04/11/16.
//  Copyright © 2016 chaitu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CONTACTS.h"

NS_ASSUME_NONNULL_BEGIN

@interface CONTACTS (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *number;

@end

NS_ASSUME_NONNULL_END
