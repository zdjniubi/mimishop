package com.zdj.miaoshaproject.dataobject;

public class FriendDO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column friend_rel.id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column friend_rel.user_id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    private Integer userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column friend_rel.friend_id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    private Integer friendId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column friend_rel.status
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    private Double status;


    private int itemId;

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column friend_rel.id
     *
     * @return the value of friend_rel.id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column friend_rel.id
     *
     * @param id the value for friend_rel.id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column friend_rel.user_id
     *
     * @return the value of friend_rel.user_id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column friend_rel.user_id
     *
     * @param userId the value for friend_rel.user_id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column friend_rel.friend_id
     *
     * @return the value of friend_rel.friend_id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public Integer getFriendId() {
        return friendId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column friend_rel.friend_id
     *
     * @param friendId the value for friend_rel.friend_id
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public void setFriendId(Integer friendId) {
        this.friendId = friendId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column friend_rel.status
     *
     * @return the value of friend_rel.status
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public Double getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column friend_rel.status
     *
     * @param status the value for friend_rel.status
     *
     * @mbg.generated Thu May 27 10:16:00 AWST 2021
     */
    public void setStatus(Double status) {
        this.status = status;
    }
}