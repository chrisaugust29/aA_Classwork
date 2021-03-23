const APIUtil = require("./api_util");

class FollowToggle {
    constructor(el) {
        
        this.$el = $(el);
        this.userId = this.$el.data('user-id')
        this.followState = this.$el.data('initial-follow-state')
        this.render();
        this.handleClick();
    }

    render() {
        if (this.followState === "unfollowed") {
            this.$el.html('Follow!')
        } else {
            this.$el.html("Unfollow!")
        }
    }

    handleClick() {
        $('.follow-toggle').on('click', e => {
            e.preventDefault();
            if (this.followState === "unfollowed") {
                APIUtil.followUser(this.userId).then(() =>{
                    this.followState = 'followed'
                    this.render()
                });

            } else {
                APIUtil.unfollowUser(this.userId).then(() =>{
                    this.followState = 'unfollowed'
                    this.render()
                })
                
            }
        })
    }
}

module.exports = FollowToggle;