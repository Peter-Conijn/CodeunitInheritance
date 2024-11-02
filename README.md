# Object Inheritance

## Inherit a base codeunit into a derived codeunit
This app shows a "faux" way of inheriting codeunits. It has a base "class" codeunit of "Person" which can be inherited by two derived "class" codeunits of Couch Potato and Athlete.
In the derived classes you can both get _and set_ the base class properties, since the codeunit instance is apparently persistent.

The app also shows two ways in which you can inherit over multiple levels. One (Professional Athlete) is using the Base() class multiple times, and the other (Professional Potato) is to provide multiple "Base" classes: one for each inherited codeunit.
This is most visible in the Print Data codeunit.

## Inherit a table and create a temporary table extension
But wait! There's more. This works for codeunits, but also for tables. This means that you can wrap a record variable into a codeunit and add "fields" (properties) and methods (procedures). In essence, this method allows you to create temporary table extensions. This means that you no longer need to add a table field for just that single process - you can simply wrap the table in a codeunit and add it there.

This is demonstrated in the Vehicle application (start at page 50111).

Try it out!
