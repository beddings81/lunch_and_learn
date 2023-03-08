# Lunch and Learn Backend Service
Lunch and Learn is the backend side of an application to search for cuisines by country, and provide opportunity to learn more about that countries culture. This app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

## Database Schema

![Screen Shot 2023-03-07 at 9 02 46 PM](https://user-images.githubusercontent.com/111210465/223609267-ed919132-5d93-4999-b8b8-f8dc1f9c6587.png)

## RESTful Endpoints

<details close>


### Get Recipes For A Particular Country


```http
GET /api/v1/recipes?country=#{country}
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
country=#{aruba}
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json

{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Aruba + A Blue Cheese Iceberg Wedge",
                "url": "http://www.edamam.com/ontologies/edamam.owl#recipe_d208694347a63750e26bbf1f3c0a1e7e",
                "country": "aruba",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/af5/af5c0c12bd8530cf170dee283ee5f580.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIA76PlrnT4Z6Jjx7CPsnAMk8%2BQODxpYGvlPP7PIrsFXmAiAI6rC1j%2FWSUtwwTUFrCv%2FGmEWbQqnjmPLOitkYOB5Cbiq4BQg7EAAaDDE4NzA..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Caribbean Sweet Bread",
                "url": "http://www.edamam.com/ontologies/edamam.owl#recipe_4a7621816fcc0b15ef72fb55f0360c80",
                "country": "aruba",
                "image": "https://edamam-product-images.s3.amazonaws.com/web-img/e60/e60567d2c7a7e48c15c4ddb6c59a23b2.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIA76PlrnT4Z6Jjx7CPsnAMk8%2BQODxpYGvlPP7PIrsFXmAiAI6rC1j%2FWSUtwwTUFrCv%2FGmEWbQqnjmPLOitkYOB5Cbiq4BQg7EAAaDDE4NzAx..."
            }
        }
```

</details>

---

### Get Learning Resources for a Particular Country


```http
GET /api/v1/learning_resources?country=#{country}
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
country=#{aruba}
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json

{
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "aruba",
            "video": {},
            "images": [
                {
                    "alt_tag": "Blue Sea Under Yellow Sky",
                    "url": "https://images.pexels.com/photos/2792043/pexels-photo-2792043.jpeg"
                },
                {
                    "alt_tag": "Photo of Speed Boat on Sea",
                    "url": "https://images.pexels.com/photos/3274985/pexels-photo-3274985.jpeg"
                },
                {
                    "alt_tag": "Photo of Speed Boat on Sea",
                    "url": "https://images.pexels.com/photos/3274984/pexels-photo-3274984.jpeg"
                },
                {
                    "alt_tag": "A Boat Docked near the Seashore",
                    "url": "https://images.pexels.com/photos/5382077/pexels-photo-5382077.jpeg"
                },
                {
                    "alt_tag": "Green Trees Near the Seashore",
                    "url": "https://images.pexels.com/photos/5874622/pexels-photo-5874622.jpeg"
                },
                {
                    "alt_tag": "A Person Riding on the Boat while Sailing on the Sea During Golden Hour",
                    "url": "https://images.pexels.com/photos/4316233/pexels-photo-4316233.jpeg"
                },
                {
                    "alt_tag": "The Adriatic Sea somewhere in Montenegro",
                    "url": "https://images.pexels.com/photos/15585593/pexels-photo-15585593.jpeg"
                },
                {
                    "alt_tag": "The Adriatic Sea somewhere in Montenegro",
                    "url": "https://images.pexels.com/photos/15585584/pexels-photo-15585584.jpeg"
                },
                {
                    "alt_tag": "The Adriatic Sea somewhere in Montenegro",
                    "url": "https://images.pexels.com/photos/15585589/pexels-photo-15585589.jpeg"
                },
                {
                    "alt_tag": "The Adriatic Sea somewhere in Montenegro",
                    "url": "https://images.pexels.com/photos/15585591/pexels-photo-15585591.jpeg"
                }
            ]
        }
    }
}
```

</details>

---


### User Registration



```http
POST /api/v1/users
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```json
{ 
    "name": "John jones",
    "email": "example4@email.com"
}
```

| Code | Description |
| :--- | :--- |
| 201 | Created |

Example Value:

```json
{
    "data": {
        "id": "2",
        "type": "user",
        "attributes": {
            "name": "John jones",
            "email": "example4@email.com",
            "api_key": "24531e63e6067de83363d046bdd952a1"
        }
    }
}
```

</details>


---


### Add Favorites

```http
POST /api/v1/favorites
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```json
{
    "api_key": "6a942b7416edb1c9d9c6defe1f6e592d",
    "country": "Usa",
    "recipe_link": "https://www.dinnertable.com/",
    "recipe_title": "Texas Cheese Fries"
}
```

| Code | Description |
| :--- | :--- |
| 201 | `CREATED` |

Example Value:

```json
{
    "success": "Favorite added successfully"
}
```


</details>


---


### Get a User’s Favorites


```http
GET /api/v1/favorites?api_key=#{api_key}
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
api_key=#{6a942b7416edb1c9d9c6defe1f6e592d}
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json
{
    "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "id": 1,
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com/.....",
                "country": "thailand",
                "created_at": "2023-03-07T16:54:26.871Z"
            }
        },
        {
            "id": "2",
            "type": "favorite",
            "attributes": {
                "id": 2,
                "recipe_title": "Pork Fried Rice",
                "recipe_link": "https://www.dinnertable.com/",
                "country": "china",
                "created_at": "2023-03-07T16:54:51.910Z"
            }
        },
        {
            "id": "3",
            "type": "favorite",
            "attributes": {
                "id": 3,
                "recipe_title": "Texas Cheese Fries",
                "recipe_link": "https://www.dinnertable.com/",
                "country": "Usa",
                "created_at": "2023-03-07T17:20:03.003Z"
            }
        },
        {
            "id": "4",
            "type": "favorite",
            "attributes": {
                "id": 4,
                "recipe_title": "Texas Cheese Fries",
                "recipe_link": "https://www.dinnertable.com/",
                "country": "Usa",
                "created_at": "2023-03-08T02:44:55.302Z"
            }
        }
    ]
}
```


</details>


---

### Get Tourist Sights for a Particular Country 


```http
GET /api/v1/tourist_sights?country=#{country}
```

<details close>
<summary>  Details </summary>
<br>
    
Parameters: <br>
```
country=#{aruba}
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json
{
    "data": [
        {
            "id": null,
            "type": "tourist_sight",
            "attributes": {
                "id": null,
                "name": "Fort Zoutman",
                "address": "Fort Zoutman, Oranjestraat, Oranjestad, Netherlands",
                "place_id": "5117d9edcc478251c059ed03d1e40d092940f00102f90130a9e02d0000000092030c466f7274205a6f75746d616e"
            }
        },
        {
            "id": null,
            "type": "tourist_sight",
            "attributes": {
                "id": null,
                "name": "Stichting Monumentenfonds Aruba",
                "address": "Stichting Monumentenfonds Aruba, Avenida Milio Croes 26, Dakota, Netherlands",
                "place_id": "516b4d4e48868151c05974ce9cc37c072940f00102f901883226160000000092031f537469636874696e67204d6f6e756d656e74656e666f6e6473204172756261"
            }
        }
    ]
 }
```


</details>


---
</details>
</details>


## Status Codes

Lunch and Learn returns the following status codes in its API:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 500 | `INTERNAL SERVER ERROR` |

## Prerequisites
Running this project requires Rails 5.2.8 and Ruby 2.7.4.

## Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`
5. Run the test suite with `bundle exec rspec`
6. Start the local server by running `rails s`

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Contributors
 
<b>Braxton Eddings</b> <br>
- GitHub: <a href="https://github.com/beddings81">@beddings81</a> <br>
- LinkedIn: <a href="https://www.linkedin.com/in/braxton-eddings/">braxton-eddings</a> <br>
