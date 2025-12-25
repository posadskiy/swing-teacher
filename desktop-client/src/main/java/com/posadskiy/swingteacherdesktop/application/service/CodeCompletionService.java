package com.posadskiy.swingteacherdesktop.application.service;

import com.posadskiy.swingteacherdesktop.domain.model.Keyword;
import com.posadskiy.swingteacherdesktop.domain.model.Shorthand;
import com.posadskiy.swingteacherdesktop.domain.repository.KeywordRepository;
import com.posadskiy.swingteacherdesktop.domain.repository.ShorthandRepository;
import lombok.extern.slf4j.Slf4j;
import org.fife.ui.autocomplete.BasicCompletion;
import org.fife.ui.autocomplete.CompletionProvider;
import org.fife.ui.autocomplete.DefaultCompletionProvider;
import org.fife.ui.autocomplete.ShorthandCompletion;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

/**
 * Application service for code completion functionality.
 */
@Slf4j
@Service
public class CodeCompletionService {
    
    private final KeywordRepository keywordRepository;
    private final ShorthandRepository shorthandRepository;
    
    public CodeCompletionService(
        KeywordRepository keywordRepository,
        ShorthandRepository shorthandRepository
    ) {
        this.keywordRepository = keywordRepository;
        this.shorthandRepository = shorthandRepository;
    }
    
    public List<Keyword> getKeywords() {
        try {
            return keywordRepository.getAllKeywords();
        } catch (SQLException ex) {
            log.error("Failed to load keywords", ex);
            return List.of();
        }
    }
    
    public List<Shorthand> getShorthands() {
        try {
            return shorthandRepository.getAllShorthands();
        } catch (SQLException ex) {
            log.error("Failed to load shorthands", ex);
            return List.of();
        }
    }
    
    /**
     * Creates a completion provider with all keywords and shorthands.
     */
    public CompletionProvider createCompletionProvider() {
        var provider = new DefaultCompletionProvider();

        // Add keyword completions
        getKeywords().stream()
            .map(Keyword::keywordText)
            .map(text -> new BasicCompletion(provider, text))
            .forEach(provider::addCompletion);

        // Add shorthand completions
        getShorthands().stream()
            .map(s -> new ShorthandCompletion(provider, s.shortText(), s.fullText(), s.fullText()))
            .forEach(provider::addCompletion);

        return provider;
    }
}


