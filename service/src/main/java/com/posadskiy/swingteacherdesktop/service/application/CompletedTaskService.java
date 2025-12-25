package com.posadskiy.swingteacherdesktop.service.application;

import com.posadskiy.swingteacherdesktop.domain.dto.CompletedTaskDto;
import com.posadskiy.swingteacherdesktop.domain.request.CompletedTaskRequest;
import com.posadskiy.swingteacherdesktop.service.domain.entity.CompletedTaskEntity;
import com.posadskiy.swingteacherdesktop.service.domain.mapper.DtoMapper;
import com.posadskiy.swingteacherdesktop.service.infrastructure.jpa.CompletedTaskRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class CompletedTaskService {
    private final CompletedTaskRepository completedTaskRepository;

    public CompletedTaskService(CompletedTaskRepository completedTaskRepository) {
        this.completedTaskRepository = completedTaskRepository;
    }

    public Optional<CompletedTaskDto> findByUserAndTask(Long userId, Long taskId) {
        return completedTaskRepository.findByUserIdAndTaskId(userId, taskId)
            .map(DtoMapper::toDto);
    }

    public List<CompletedTaskDto> findByUser(Long userId) {
        return completedTaskRepository.findByUserId(userId)
            .stream()
            .map(DtoMapper::toDto)
            .toList();
    }

    @Transactional
    public CompletedTaskDto create(CompletedTaskRequest request) {
        CompletedTaskEntity entity = new CompletedTaskEntity();
        entity.setUserId(request.userId());
        entity.setTaskId(request.taskId());
        return DtoMapper.toDto(completedTaskRepository.save(entity));
    }
}


