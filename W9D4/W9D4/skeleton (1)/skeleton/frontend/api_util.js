const APIUtil = {
    
    followUser: id => {
        $.ajax({
            method: 'POST',
            url: `/users/${id}/follow`,
            dataType: 'json'
        })
        // .then(() => {
        //     this.followState = 'followed'
            
        // })
        // ...
    },

    unfollowUser: id => {
        $.ajax({
            method: 'DELETE',
            url: `/users/${id}/follow`,
            dataType: 'json'
        })
      
        // })
        // // ...
    }
};

module.exports = APIUtil;