import { ajax } from 'discourse/lib/ajax';
import { popupAjaxError } from 'discourse/lib/ajax-error';

export default {
  actions: {
    convertToTicket() {
      var current_state = this.get('create_ticket_block');
      this.set('create_ticket_block', !current_state);

      const priority = [
        {
            "id": "priority-high",
        },
        {
            "id": "priority-immediate",
        },
        {
            "id": "priority-low",
        },
        {
            "id": "priority-normal",
        }
      ];

      const status = [
        {"id": "status-backburner"},
        {"id": "status-new"},
        {"id": "status-resolved"},
        {"id": "status-triaging"},
        {"id": "status-underway"},
        {"id": "status-waiting"}
      ];

      const reasons = [
        { "id":"reason-appealforhelp"},
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
      this.set('list-status', status);
      this.set('list-reasons', reasons);

      var that = this;

      return ajax("/u/search/users?group=staff", {
        type: 'GET',
      }).then((users) => {
        that.set('list-users', users.users);
      }).catch(popupAjaxError)
      .finally(() => {});
    }
  }
};
