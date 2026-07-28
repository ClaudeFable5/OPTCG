-- AUTO-GENERATED: ST29-012 / 몽키 D. 루피
-- rules_id=ST29-012 script_id=880002297 fingerprint=e785b2eb92d7a7f715d00106092cfc35e9e9eae8b5af746a1c1342b6110669e0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST29-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
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
        source_text=[[【기동: 메인】【턴 1회】자신의 「몽키 D. 루피」 1장에 레스트 상태인 두웅!! 1장까지를 붙인다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST29-012]],
    schema_version=1,
  })
end
