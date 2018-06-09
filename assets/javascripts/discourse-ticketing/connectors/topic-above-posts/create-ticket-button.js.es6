
import { ajax } from 'discourse/lib/ajax';

export default {
  actions: {
    convertToTicket() {
      var current_state = this.get('create_ticket_block');
      this.set('create_ticket_block', !current_state);

      const priority = [
        {
            "id": "priority-high",
            "text": "priority-high",
            "count": 0,
            "pm_count": 0
        },
        {
            "id": "priority-immediate",
            "text": "priority-immediate",
            "count": 0,
            "pm_count": 0
        },
        {
            "id": "priority-low",
            "text": "priority-low",
            "count": 0,
            "pm_count": 0
        },
        {
            "id": "priority-normal",
            "text": "priority-normal",
            "count": 0,
            "pm_count": 0
        }
      ];

      const reasons = [
        {"id": "reason-appealforhelp"},
        { "id":"reason-bademail"},
        { "id":"reason-cancelaccount"},
        { "id":"reason-confirmemail"},
        { "id":"reason-coreapp"},
        { "id":"reason-exchange"},
        { "id":"reason-forumpost"},
        { "id":"reason-forumtopic"},
        { "id":"reason-memberprofile"},
        { "id":"reason-networkinvite"},
        { "id":"reason-nps"},
        { "id":"reason-onboarding"},
        { "id":"reason-orgprofile"},
        { "id":"reason-partnership"},
        { "id":"reason-resource"},
        { "id":"reason-skypecall"},
        { "id":"reason-topicmerge"},
        { "id":"reason-username"},
        { "id":"reason-webinar" }
      ]

      this.set('list-priority', priority);
      this.set('list-reasons', reasons)
    }
  }
};
