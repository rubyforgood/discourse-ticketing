import { ajax } from 'discourse/lib/ajax';
import { popupAjaxError } from 'discourse/lib/ajax-error';
import Topic from 'discourse/models/topic';

export default Ember.Component.extend({
  actions: {
    convertToTicket() {
      var current_state = this.get('create_ticket_block');
      this.set('create_ticket_block', !current_state);

      this.set('list-priority', this.priority());
      this.set('list-status', this.status());
      this.set('list-reasons', this.reasons());

      this.set(`priority-value`, this.priority()[0]);
      this.set(`status-value`, this.status()[0]);
      this.set(`reasons-value`, this.reasons()[0]);

      var that = this;
      return ajax("/u/search/users?group=staff", {
        type: 'GET',
      }).then((users) => {
        that.set('list-users', users.users);
        that.set(`user-value`, users.users[0].username);
      }).catch(popupAjaxError)
      .finally(() => {});
    },

    save() {
      console.log(this.get('user-value'));
      console.log(this.get('priority-value'));

      Topic.update(this.get('topic'), {tags: this._mergeTags()})
        // .then(() => {
        //   // We roll back on success here because `update` saves the properties to the topic
        //   this.rollbackBuffer();
        //   this.set('editingTopic', false);
        // })
        .catch(popupAjaxError);
    },

    cancel() {
      console.log('qwer');
    },

    set_users(event) {
      this.set(`user-value`, event);
    },

    set_priority(event) {
      this.set(`priority-value`, event);
    },

    set_status(event) {
      this.set(`status-value`, event);
    },

    set_reasons(event) {
      this.set(`reasons-value`, event);
    }
  },

  priority() {
    return [
      { "id": "priority-high" },
      { "id": "priority-immediate" },
      { "id": "priority-low" },
      { "id": "priority-normal" }
    ];
  },

  status() {
    return [
      { "id": "status-backburner" },
      { "id": "status-new" },
      { "id": "status-resolved" },
      { "id": "status-triaging" },
      { "id": "status-underway" },
      { "id": "status-waiting" }
    ];
  },

  reasons() {
    return [
      { "id":"reason-appealforhelp" },
      { "id":"reason-bademail" },
      { "id":"reason-cancelaccount" },
      { "id":"reason-confirmemail" },
      { "id":"reason-coreapp" },
      { "id":"reason-exchange" },
      { "id":"reason-forumpost" },
      { "id":"reason-forumtopic" },
      { "id":"reason-memberprofile" },
      { "id":"reason-networkinvite" },
      { "id":"reason-nps" },
      { "id":"reason-onboarding" },
      { "id":"reason-orgprofile" },
      { "id":"reason-partnership" },
      { "id":"reason-resource" },
      { "id":"reason-skypecall" },
      { "id":"reason-topicmerge" },
      { "id":"reason-username" },
      { "id":"reason-webinar" }
    ];
  },

  _mergeTags() {
    const tags = this.get('topic').tags;

    // hard coded for now, merge into branch: pc-hm-move-topic-ticket
    tags.push('ticket');
    tags.push('status-waiting');

    return tags;
  },
});
