# Tea For Me API

![ruby](https://img.shields.io/static/v1?message=2.7.4&logo=ruby&style=for-the-badge&label=Ruby&color=darkred&labelColor=crimson) ![Postgres](https://img.shields.io/static/v1?message=14.6&=postgresql&style=for-the-badge&label=Postgresql&color=dodgerblue&labelColor=royalblue&logoColor=white) ![postman](https://img.shields.io/static/v1?message=POSTMAN&logo=postman&style=for-the-badge&label=&color=orangered&labelColor=darkorange&logoColor=white) ![ror](https://img.shields.io/static/v1?message=5.2.8.1&logo=rubyonrails&style=for-the-badge&label=Rails&color=crimson&labelColor=darkred) 


## Contributors
[Andrew Mullins](https://www.linkedin.com/in/andrewmullins233/)


## Welcome
<p>
This repository houses the backend API for a fictional tea subscription service called TeaForMe, an app that lets you subscribe for a tea delivery service.

Built in Rails on a Postgresql database and written in Ruby.
</p>

## GitHub Repo
### [TeaForMe](https://github.com/mullinsand/TeaForMe)

## Setup

- `Ruby 2.7.4`
- `Rails 5.2.8.1'`
- [Fork this repository](https://github.com/mullinsand/TeaForMe)
- Clone your fork
- From the command line, install gems and set up your DB:
- `bundle install`
- `rails db:{create,migrate,seed}`
- run the server with 'rails s'
- Go to Postman and use one of the endpoints listed below
- Alternatively you can download the Postman Suite and run the [premade endpoints](./app/assets/images/files/TeaForMePostman.json)

## Database Schema

<img src="./app/assets/images/schema.png" alt="The schema of the project includes 5 tables."  width="900" height="500" />


## API Endpoints

This section describes the endpoints in the backend API. For each endpoint, the Request Structure is displayed as a sample request sent to a root url. The Sample Response exposes an example JSON response.

### Get all customer's subscriptions endpoint

#### Request Structure
```
GET http://localhost:3000/api/v1/customer/subscriptions?api_key=123456
```
 - params are `api_key` which is the key associated with the customer
#### Sample Response
```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Tea for meee",
                "price": 1232,
                "frequency": 12,
                "created_at": "2023-01-10T21:50:08.849Z",
                "updated_at": "2023-01-10T21:50:08.849Z"
            },
            "relationships": {
                "teas": {
                    "data": [
                        {
                            "id": "1",
                            "type": "tea"
                        }
                    ]
                }
            }
        }
    ]
}
```
___

### Subscribe a customer to a tea subscription endpoint

#### Request Structure
```
POST http://localhost:3000/api/v1/customer_subscription?api_key=123456&sub_id=2
```
 - params are
    - `api_key` which is the key associated with the customer
    - `sub_id` which is the ID of the specific subscription
#### Sample Response
```
{
    "message": "Customer successfully subscribed"
}
```
___

### cancel a customer's tea subscription endpoint

#### Request Structure
```
PATCH/PUT http://localhost:3000/api/v1/customer_subscription?api_key=123456&sub_id=2&status=cancelled
```
 - params are
    - `api_key` which is the key associated with the customer
    - `sub_id` which is the ID of the specific subscription
    - `status` which is the status of the subscription in relation to the customer
      - accepted values are `active` and  `cancelled`
#### Sample Response
```
{
    "message": "Customer successfully unsubscribed"
}
```
___
