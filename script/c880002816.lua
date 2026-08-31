-- MANUAL: OP17-110 / 샬롯 페로스페로 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-110]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=6,
              trait=[[빅 맘 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[YOUR_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【자신의 턴 동안】【등장 시】자신의 패에서 코스트 6 이하인 특징 《빅 맘 해적단》을 가진 캐릭터 카드 1장까지를 등장시킨다. 그 후, 이 캐릭터는 이번 턴 동안 【속공】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-110]],
    schema_version=1,
  })
end
