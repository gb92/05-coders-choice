Name: Gavin Benedict          ID: 34437459

## Proposed Project

So my mom has an ebay business where she resells unique items 
that she finds at thrift stores/garage sales. I'd like to build 
an inventory management service for that business that can track 
the items that she brings and generate a report for determining 
revenues/profits.

## MVP (Minimum Viable Project)

What I would consider barebones MVP:
- Being able to Add/Update/Delete items from inventory
- Storing item names, descriptions, original purchase price, ebay item id
- Retrieving the sale price of an item from ebay if it has one and 
  displaying it as part of item view/retrieving it for analytics

What I consider nonessential but bonus features for a month long project:
- Storing images in an Azure Storage/Amazon S3 container for item view
- Having a user button that actually posts an item to eBay 
- Having scheduled jobs to track current bids, and sale price and using that
  data to generate a nice visual of expected revenue/profit

## Outline Structure

One module for basic Ebay API access. One module for doing analytics/reporting. 
One module for DB access, and one module for the web front end. 

The module for Ebay API access will utilize HTTP/JSON (possibly XML since some of Ebay's API is SOAP based) 
libraries for accessing ebay to determine sale price of items and possibly more , which will run as 
a supervised genserver. The analytics/reporting module will use the Quantum package for running scheduled tasks
in the background that aggregate sales information, and use the DB module to add that information back into the DB. 
This module will also likely run as a supervised genserver. The DB module will use Ecto to access a PostgresDB. 
The web frontend module will be a Phoenix web app. 