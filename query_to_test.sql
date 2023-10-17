-- 1. input: /start
SELECT id_inbox,chat_id,msg,msg_type INTO @v_id_inbox, @v_chat_id, @v_msg, @v_msg_type FROM tb_inbox LIMIT 0,1;
SELECT @v_id_inbox, @v_chat_id, @v_msg, @v_msg_type;
CALL sp_pengenalan_pola(@v_id_inbox, @v_chat_id, @v_msg, @v_msg_type);

-- 2. input: menu
SELECT id_inbox,chat_id,msg,msg_type INTO @v_id_inbox_2, @v_chat_id_2, @v_msg_2, @v_msg_type_2 FROM tb_inbox LIMIT 1,1;
SELECT @v_id_inbox_2, @v_chat_id_2, @v_msg_2, @v_msg_type_2;
CALL sp_pengenalan_pola(@v_id_inbox_2, @v_chat_id_2, @v_msg_2, @v_msg_type_2);

-- 3. input: tmpilkan fto awl aktivtas
SELECT id_inbox,chat_id,msg,msg_type INTO @v_id_inbox_3, @v_chat_id_3, @v_msg_3, @v_msg_type_3 FROM tb_inbox LIMIT 2,1;
SELECT @v_id_inbox_3, @v_chat_id_3, @v_msg_3, @v_msg_type_3;
CALL sp_pengenalan_pola(@v_id_inbox_3, @v_chat_id_3, @v_msg_3, @v_msg_type_3);