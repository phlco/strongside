# Objects in the Mail

Create a new rails_app called mail_objects_app

Create jasmine tests for the following.

Read through the following requirements, then set about creating tests for the following objects and make sure that each of them works and interacts with the others as described.

Create spec files for each.

- MailItem Object
  - MailItem should have a `shipToAddress` string
  - MailItem should have a `stampValue` number
- Postcard object
  - Postcard should have a `message` string
- Package object
  - Package should have a `content` array
  - Package should have a `fragile` boolean
  - Package should have a `broken` boolean
  - Package should have a method `shake()`
    - If the Package's `fragile` is true and `shake()` is invoked then `broken` should be set to `true`
  - Package should have an `isBroken()` method that returns whether it is broken or not

- Mailbox Object
  - Mailbox should have an array of MailItem objects
  - Mailbox should have an `acceptMail` method
    - acceptMail should take a `postcard` or `package`
    - acceptMail should place that mail in the Mailbox's array of MailItem objects
  - Mailbox should have an `openMail` method that removes and returns the first item in its array of MailItem objects
  - Mailbox should have a `toString` method that includes the number of postcards and packages in the mailbox
    - Example: `The mailbox has 16 postcards and 3 packages`


You can create additional methods beyond the ones listed.
