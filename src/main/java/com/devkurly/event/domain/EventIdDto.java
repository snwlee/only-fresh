package com.devkurly.event.domain;

import java.util.Objects;

public class EventIdDto {
    private Integer event_id;

    public EventIdDto(){}
    public EventIdDto(Integer event_id) {
        this.event_id = event_id;
    }

    public Integer getEvent_id() {
        return event_id;
    }

    public void setEvent_id(Integer event_id) {
        this.event_id = event_id;
    }

    @Override
    public String toString() {
        return "EventIdDto{" +
                "event_id=" + event_id +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof EventIdDto)) return false;
        EventIdDto that = (EventIdDto) o;
        return event_id.equals(that.event_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(event_id);
    }
}
