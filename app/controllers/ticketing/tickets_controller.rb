module Ticketing
  class TicketsController < ApplicationController
    def index
      render json: [
        {
          "id": 3424,
          "topicOrPost": 'post',
          "title": "A Cool Ticket",
          "priority": 'high',
          "status": 'waiting',
          "dateCreated": "2018-06-09T15:59:55.725Z",
          "dateDue": "2018-06-09T15:59:55.725Z",
          "assignee": {
            "id":3,
            "username":"howardm",
            "avatar_template":"/letter_avatar_proxy/v2/letter/h/f19dbf/{size}.png",
            "active":false,
            "admin":false,
            "moderator":false,
            "last_seen_at":nil,
            "last_emailed_at": "2018-06-09T15:59:55.725Z",
            "created_at": "2018-06-09T15:59:47.937Z",
            "last_seen_age":nil,
            "last_emailed_age":7156.707830402,
            "created_at_age":7164.495096115,
            "username_lower":"howardm",
            "trust_level":1,
            "manual_locked_trust_level":nil,
            "flag_level":0,
            "title":nil,
            "suspended":false,
            "time_read":0,
            "staged":false,
            "days_visited":0,
            "posts_read_count":0,
            "topics_entered":0,
            "post_count":0
          },
          "creator": {
            "id":3,
            "username":"howardm",
            "avatar_template":"/letter_avatar_proxy/v2/letter/h/f19dbf/{size}.png",
            "active":false,
            "admin":false,
            "moderator":false,
            "last_seen_at":nil,
            "last_emailed_at": "2018-06-09T15:59:55.725Z",
            "created_at": "2018-06-09T15:59:47.937Z",
            "last_seen_age":nil,
            "last_emailed_age":7156.707830402,
            "created_at_age":7164.495096115,
            "username_lower":"howardm",
            "trust_level":1,
            "manual_locked_trust_level":nil,
            "flag_level":0,
            "title":nil,
            "suspended":false,
            "time_read":0,
            "staged":false,
            "days_visited":0,
            "posts_read_count":0,
            "topics_entered":0,
            "post_count":0
          },
          "involvedUsers": [
            {
              "id":3,
              "username":"howardm",
              "avatar_template":"/letter_avatar_proxy/v2/letter/h/f19dbf/{size}.png",
              "active":false,
              "admin":false,
              "moderator":false,
              "last_seen_at":nil,
              "last_emailed_at": "2018-06-09T15:59:55.725Z",
              "created_at": "2018-06-09T15:59:47.937Z",
              "last_seen_age":nil,
              "last_emailed_age":7156.707830402,
              "created_at_age":7164.495096115,
              "username_lower":"howardm",
              "trust_level":1,
              "manual_locked_trust_level":nil,
              "flag_level":0,
              "title":nil,
              "suspended":false,
              "time_read":0,
              "staged":false,
              "days_visited":0,
              "posts_read_count":0,
              "topics_entered":0,
              "post_count":0
            }
          ],
          "href": 'https://example.com/ticketing/tickets/post/3424'
        },
        {
          "id": 3425,
          "topicOrPost": 'post',
          "title": "An Uncool Ticket",
          "priority": 'low',
          "status": 'new',
          "dateCreated": "2018-06-09T15:59:55.725Z",
          "dateDue": "2018-06-11T15:59:55.725Z",
          "assignee": {
            "id":3,
            "username":"howardm",
            "avatar_template":"/letter_avatar_proxy/v2/letter/h/f19dbf/{size}.png",
            "active":false,
            "admin":false,
            "moderator":false,
            "last_seen_at":nil,
            "last_emailed_at": "2018-06-09T15:59:55.725Z",
            "created_at": "2018-06-09T15:59:47.937Z",
            "last_seen_age":nil,
            "last_emailed_age":7156.707830402,
            "created_at_age":7164.495096115,
            "username_lower":"howardm",
            "trust_level":1,
            "manual_locked_trust_level":nil,
            "flag_level":0,
            "title":nil,
            "suspended":false,
            "time_read":0,
            "staged":false,
            "days_visited":0,
            "posts_read_count":0,
            "topics_entered":0,
            "post_count":0
          },
          "creator": {
            "id":3,
            "username":"howardm",
            "avatar_template":"/letter_avatar_proxy/v2/letter/h/f19dbf/{size}.png",
            "active":false,
            "admin":false,
            "moderator":false,
            "last_seen_at":nil,
            "last_emailed_at": "2018-06-09T15:59:55.725Z",
            "created_at": "2018-06-09T15:59:47.937Z",
            "last_seen_age":nil,
            "last_emailed_age":7156.707830402,
            "created_at_age":7164.495096115,
            "username_lower":"howardm",
            "trust_level":1,
            "manual_locked_trust_level":nil,
            "flag_level":0,
            "title":nil,
            "suspended":false,
            "time_read":0,
            "staged":false,
            "days_visited":0,
            "posts_read_count":0,
            "topics_entered":0,
            "post_count":0
          },
          "involvedUsers": [
            {
              "id":3,
              "username":"howardm",
              "avatar_template":"/letter_avatar_proxy/v2/letter/h/f19dbf/{size}.png",
              "active":false,
              "admin":false,
              "moderator":false,
              "last_seen_at":nil,
              "last_emailed_at": "2018-06-09T15:59:55.725Z",
              "created_at": "2018-06-09T15:59:47.937Z",
              "last_seen_age":nil,
              "last_emailed_age":7156.707830402,
              "created_at_age":7164.495096115,
              "username_lower":"howardm",
              "trust_level":1,
              "manual_locked_trust_level":nil,
              "flag_level":0,
              "title":nil,
              "suspended":false,
              "time_read":0,
              "staged":false,
              "days_visited":0,
              "posts_read_count":0,
              "topics_entered":0,
              "post_count":0
            }
          ],
          "href": 'https://example.com/ticketing/tickets/post/3424'
        }
      ]
    end
  end
end