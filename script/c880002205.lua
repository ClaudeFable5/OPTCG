-- AUTO-GENERATED: OP14-040 / 징베
-- rules_id=OP14-040 script_id=880002205 fingerprint=514c474a6d2f81ea3185e7e78b67772b20e1a70923656207cc3b582fb1382d6b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-040]],
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
                trait_any={
                  [[어인족]],
                  [[인어족]],
                },
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버릴 수 있다: 자신의 《어인족》이나 《인어족》 특징을 가진 리더 또는 캐릭터 1장에 레스트 상태인 두웅!! 2장까지를 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-040]],
    schema_version=1,
  })
end
