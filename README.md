# Instagram Database Clone

This project focuses on creating a database structure that mimics some of the key features of Instagram. It includes tables for users, photos, comments, likes, hashtags, followers, and more.

## Database Schema

### Users
- Table for storing user information, including their username and registration date.

### Photos
- Table for storing photo data, including image URLs and the user who posted the photo.

### Comments
- Table for storing comments made on photos, including the comment text, user, and photo associations.

### Likes
- Table for tracking user likes on photos, including the user, photo, and timestamp. It also counts the number of likes a photo receives.

### Follows
- Table for tracking user followers and followings. It records who follows whom and the timestamp of the follow action.

### Hashtags
- Table for storing hashtag information, allowing users to tag photos with specific hashtags.

### Photo Tags
- Table for associating photos with hashtags, enabling users to find photos by clicking on hashtags.

## Getting Started

To create the Instagram database clone locally, you can use the provided SQL script. Simply execute the SQL commands in the script to set up the database schema.

```bash
# Drop the existing database (if needed)
DROP DATABASE ig_clone;

# Create a new database
CREATE DATABASE ig_clone;
USE ig_clone;

# Create tables and define relationships (users, photos, comments, likes, follows, hashtags, photo_tags)
... (Insert SQL commands here)





