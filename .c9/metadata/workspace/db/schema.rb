{"filter":false,"title":"schema.rb","tooltip":"/db/schema.rb","undoManager":{"mark":0,"position":0,"stack":[[{"group":"doc","deltas":[{"start":{"row":13,"column":46},"end":{"row":13,"column":51},"action":"remove","lines":["05255"]},{"start":{"row":13,"column":46},"end":{"row":13,"column":51},"action":"insert","lines":["14451"]},{"start":{"row":30,"column":11},"end":{"row":30,"column":14},"action":"insert","lines":["   "]},{"start":{"row":31,"column":2},"end":{"row":31,"column":5},"action":"remove","lines":["end"]},{"start":{"row":31,"column":2},"end":{"row":36,"column":70},"action":"insert","lines":["  t.integer \"user_id\"","    t.integer \"article_id\"","  end","","  add_index \"comments\", [\"article_id\"], name: \"index_comments_on_article_id\"","  add_index \"comments\", [\"user_id\"], name: \"index_comments_on_user_id\""]}]}]]},"ace":{"folds":[],"scrolltop":180,"scrollleft":0,"selection":{"start":{"row":31,"column":23},"end":{"row":32,"column":22},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1425154858000,"hash":"441d820caff979a57bb8b5e5bed02cf005888317"}