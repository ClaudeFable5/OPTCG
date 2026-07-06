-- AUTO-GENERATED: OP04-073 / Mr.13 & 미스 프라이데이
-- rules_id=OP04-073 script_id=880000565 fingerprint=c1ef999916bc9b4d066cc32753dd9e268498feb64d4e8e58f7e7c3ded89b0df8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
          {
            count=1,
            op=[[TRASH_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                exclude_self=true,
                trait_contains=[[바로크 워크스]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터와 자신의 『바로크 워크스』를 포함한 특징을 가진 캐릭터 1장을 트래시에 놓을 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
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
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-073]],
    schema_version=1,
  })
end
