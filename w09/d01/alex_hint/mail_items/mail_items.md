# Objects in the Mail

Read through the following requirements, then set about creating tests for the following objects and make sure that each of them works and interacts with the others as described.

Create spec files for each.

- MailItem Object
  - MailItem should have a ship_to_address
  - MailItem should have a stamp_value
- Postcard object
  - Postcard should inherit MailItem
  - Postcard should have a message
  - Postcard should have a method to return its message
- Package object
  - Pacakge should inherit MailItem
  - Package should have a `content` array
  - Package should have an `is_fragile` boolean
  - Package should have an `is_broken` boolean
  - Package should have a method `shake`
    - If the Package `is_fragile` and is shaken... `is_broken` should be set to `true`
  - Package should have an `is_broken?` method that returns whether it is broken or not

- Mailbox Object
  - Mailbox should have an array of MailItem objects
  - Mailbox should have an `accept_mail` method
    - accept_mail should take a `postcard` or `package`
    - accept_mail should place that mail in the Mailbox's array of MailItem objects
  - Mailbox should have an `open_mail` method that removes and returns the first item in its array of MailItem objects
  - Mailbox should have a `to_s` method that includes the number of postcards and packages in the mailbox
    - Example: `The mailbox has 16 postcards and 3 packages`
    

You can create additional methods beyond the ones listed.