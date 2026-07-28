-- AUTO-GENERATED: EB04-039 / 유스타스 키드
-- rules_id=EB04-039 script_id=880002460 fingerprint=5f67cbdfd17a3ae03e72b5699c7688b8c176fa2e263c3058b95a0c317cd5e8fc
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-039]],
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
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!! 덱에서 두웅!! 1장까지를 액티브로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              trait=[[키드 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 패에서 코스트 5 이하인 《키드 해적단》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-039]],
    schema_version=1,
  })
end
