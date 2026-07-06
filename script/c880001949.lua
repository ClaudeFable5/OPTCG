-- AUTO-GENERATED: ST21-009 / 나미
-- rules_id=ST21-009 script_id=880001949 fingerprint=78b0c7cce00d51f94a737f957f38bc9e86ddc05fde38d147eaf231ce1559703e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST21-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《밀짚모자 일당》 특징을 가진 리더 또는 캐릭터 1장에게 레스트 상태인 두웅!!을 2장까지 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST21-009]],
    schema_version=1,
  })
end
