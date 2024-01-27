# Tea Subscription

* An endpoint to subscribe a customer to a tea subscription
* An endpoint to cancel a customer’s tea subscription
* An endpoint to see all of a customer’s subsciptions (active and cancelled)

## Versions
  * 3.2.2
  * System dependencies
    * Rails "~> 7.1.2"
    * Mongoid "~> 8.1"  
  
## Configuration
```yaml
# config/mongoid.yml
development:
  clients:
    default:
      # find your cluster connection string
      uri: mongodb+srv://<clusterName>.<clusterID>.mongodb.net/<collectionName>?authSource=%24external&authMechanism=MONGODB-X509&retryWrites=true&w=majority
      options:
        ssl: true
        ssl_cert: /path/to/your/cert.pem
        ssl_key: /path/to/your/<cert>.pem  # should be same as above, must still be specified
```
## Database Schema
  * notes:
    * Customer has `many_embedded :subscriptions`
      * this means Subscription does not have a root path but only a parent path, for this reason, the subscription will not have a collection of it's own and only exist with a customer
    * Subscriptions will keep track of `field tea_ids, type: Array, default: []`
      * Teas should be independent of a subscription and a tea_id points to a unique tea object
        * Teas do have their own collection and will be referenced by their id
      * because a subscription is a child document, it cannot `have_many :teas` or other traditional associations; a helper method `#teas` assists with converting the tea_ids to an array of tea objects
  * ![erd](/Users/trpubz/turing2308/4mod/projects/int/tea_sub/storage/Diagram export Jan 27 2024.png)
## Database creation
   * go to Mongo Atlas and create a new (free) shared cluster
   * inside the cluster overview page
     * under Security < Quickstart
     * select `Certificate` option for Atlas Managed X.509 auth
       * provide a common name for the connection & download the .pem file
       * note the path (as will provide to the [mongoid.yml](config/mongoid.yml))
## Database initialization
    * you can manually create the collection you want via Atlas UI or Mongo Compass
    * the collection name is provided to the the uri arg in the [mongoid.yml](config/mongoid.yml)
## How to run the test suite
    ```ruby
    bundle exec rspec
    ```

## Deployment instructions
  * as long as the cluster is live, running the app with `rails s` will access the Atlas DB
