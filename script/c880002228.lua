-- AUTO-GENERATED: OP14-063 / 슈거
-- rules_id=OP14-063 script_id=880002228 fingerprint=8a101c0b47ea952918774b908328dcdc93eaed7b671635f9f8156c9614d2ab18
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-063]],
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
        source_text=[[【등장 시】두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
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
              trait=[[돈키호테 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            count=6,
            op=[[FIELD_DON_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】상대 필드의 두웅!!이 6장 이상 있는 경우, 자신의 패에서 코스트 5 이하인 《돈키호테 해적단》 특징을 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-063]],
    schema_version=1,
  })
end
