db.comments.insertMany([
    { _id: 1, author: 'Ivan Ivanov', created_at: '', comment_Text: '', comment_rating: 1, reply_to_comment: '', video_link: 'link', comment_status: 'published'},
    { _id: 2, author: 'Petr', created_at: '', comment_Text: '', comment_rating: 3, reply_to_comment: '', video_link: 'link', comment_status: 'deleted' },
    {  _id: 3, author: 'Leon', created_at: '', comment_Text: '', comment_rating: 9, reply_to_comment: '', video_link: 'link', comment_status: 'published'},
    {  _id: 4, author: 'Richard', created_at: '', comment_Text: '', comment_rating: 8, reply_to_comment: '', video_link: 'link', comment_status: 'published'},
    {  _id: 5, author: 'Tanja', created_at: '', comment_Text: '', comment_rating: 2, reply_to_comment: '', video_link: 'link', comment_status: 'deleted'}
    ])
    
    
    db.reactions.insertMany([
    { _id: 1, author: 'Ivan Ivanov', created_at: '', reaction_type: '', video_link: '', reaction_comment: '', reaction_status: '' },
    { _id: 2, author: 'Petr', created_at: '', reaction_type: '', video_link: '', reaction_comment: '', reaction_status: '' },
    { _id: 3, author: 'Richard', created_at: '', reaction_type: '', video_link: '', reaction_comment: '', reaction_status: '' },
    { _id: 4, author: 'Ruslan', created_at: '', reaction_type: '', video_link: '', reaction_comment: '', reaction_status: '' },
   { _id: 5, author: 'Tanja', created_at: '', reaction_type: '', video_link: '', reaction_comment: '', reaction_status: '' },
])